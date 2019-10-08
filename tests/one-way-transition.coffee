Promise = require '../src/'

value = 'wow, so refreshing!'
reason = 'too expensive for what I am getting :/'

test 'when a promise is fulfilled it should not be rejected with another value', (done) ->
  onFulfilled = jest.fn()
  onRejected = jest.fn()

  promise = new Promise (fulfill, reject) ->
    fulfill value
    reject reason

  promise.then onFulfilled, onRejected

  setTimeout (->
    expect(onFulfilled.mock.calls.length).toBe 1
    expect(onFulfilled.mock.calls[0][0]).toBe value
    expect(onRejected.mock.calls.length).toBe 0
    expect(promise.state).toBe 'FULFILLED'
    done()
  ), 5

test 'when a promise is rejected it should not be fulfilled with another value', (done) ->
  onFulfilled = jest.fn()
  onRejected = jest.fn()

  promise = new Promise (fulfill, reject) ->
    reject reason
    fulfill value
  promise.then onFulfilled, onRejected

  setTimeout (->
    expect(onRejected.mock.calls.length).toBe 1
    expect(onRejected.mock.calls[0][0]).toBe reason
    expect(onFulfilled.mock.calls.length).toBe 0
    expect(promise.state).toBe 'REJECTED'
    done()
  ), 5
