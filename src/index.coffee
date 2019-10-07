PENDING = 'PENDING'
FULFILLED = 'FULFILLED'
REJECTED = 'REJECTED'

class Promise
  constructor: (executor) ->
    @state = PENDING
    @called = false
    @doResolve executor

  doResolve: (executor) ->
    executor @fulfill, @reject

  fulfill: (value) =>
    return if @called
    @called = true
    @state = FULFILLED
    @value = value

  reject: (reason) =>
    return if @called
    @called = true
    @state = REJECTED
    @value = reason

  then: (onFulfilled, onRejected) ->
    (if @state == FULFILLED then onFulfilled else onRejected) @value

module.exports = Promise
