PENDING = 'PENDING'
FULFILLED = 'FULFILLED'
REJECTED = 'REJECTED'

class Promise
  constructor: (executor) ->
    @state = PENDING
    @doResolve executor

  doResolve: (executor) ->
    executor @fulfill, @reject

  fulfill: (value) =>
    @state = FULFILLED
    @value = value

  reject: (reason) =>
    @state = REJECTED
    @value = reason

  then: (onFulfilled, onRejected) ->
    (if @state == FULFILLED then onFulfilled else onRejected) @value

module.exports = Promise
