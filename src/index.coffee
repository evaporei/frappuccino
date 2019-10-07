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

  handle: ({ onFulfilled, onRejected }) ->
    (if @state is FULFILLED then onFulfilled else onRejected) @value

  then: (onFulfilled, onRejected) ->
    callbacks = { onFulfilled, onRejected }
    if @state is PENDING
      @queue.push callbacks
    else
      @handle callbacks

module.exports = Promise
