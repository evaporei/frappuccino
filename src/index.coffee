PENDING = 'PENDING'
FULFILLED = 'FULFILLED'
REJECTED = 'REJECTED'

class Promise
  constructor: (executor) ->
    @state = PENDING
    @called = false
    @queue = []
    @doResolve executor

  doResolve: (executor) ->
    try
      executor @fulfill, @reject
    catch error
      @reject error

  fulfill: (value) =>
    return if @called
    @called = true
    @state = FULFILLED
    @value = value
    @finale()

  reject: (reason) =>
    return if @called
    @called = true
    @state = REJECTED
    @value = reason
    @finale()

  finale: ->
    @handle callbacks for callbacks in @queue

  handleResolved: ({ promise, onFulfilled, onRejected }) ->
    cb = (if @state is FULFILLED then onFulfilled else onRejected)

    if typeof cb isnt 'function'
      if @state == FULFILLED
        promise.fulfill @value
      else
        promise.reject @value
      return

    try
      value = cb @value
      promise.fulfill value
    catch error
      promise.reject error

  handle: (data) ->
    promise = @

    while promise.value instanceof Promise
      promise = promise.value

    if promise.state is PENDING
      promise.queue.push data
    else
      promise.handleResolved data

  then: (onFulfilled, onRejected) ->
    promise = new Promise ->

    @handle { promise, onFulfilled, onRejected }

    promise

module.exports = Promise
