Promise = require '../src/'

test 'should have a .then method', ->
  promise = new Promise (resolve, reject) ->
  expect(typeof promise.then).toBe 'function'

test 'should call the onFulfilled method when a promise is in a FULFILLED state', ->
  value = 'a nice frappuccino'
  onFulfilled = jest.fn()
  promise = new Promise (fulfill, reject) ->
    fulfill value
  promise.then onFulfilled
  expect(onFulfilled.mock.calls.length).toBe 1
  expect(onFulfilled.mock.calls[0][0]).toBe value

test 'should call the onRejected method when a promise is in a REJECTED state', ->
  reason = 'uhhh, why do I keep ordering frappuccinos'
  onRejected = jest.fn()
  promise = new Promise (fulfill, reject) ->
    reject reason
  promise.then null, onRejected
  expect(onRejected.mock.calls.length).toBe 1
  expect(onRejected.mock.calls[0][0]).toBe reason
