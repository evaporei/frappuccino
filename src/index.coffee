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
    @handleResolved callbacks for callbacks in @queue

  handleResolved: ({ promise, onFulfilled, onRejected }) ->
    cb = (if @state is FULFILLED then onFulfilled else onRejected)
    try
      value = cb @value
      promise.fulfill value
    catch error
      promise.reject error

  then: (onFulfilled, onRejected) ->
    promise = new Promise ->
    data = { promise, onFulfilled, onRejected }

    if @state is PENDING
      @queue.push data
    else
      @handleResolved data

    promise

module.exports = Promise
