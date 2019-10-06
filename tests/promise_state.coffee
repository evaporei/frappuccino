Promise = require '../src/'

test 'receives an executor function when constructed that is called immediately', ->
  executor = jest.fn()
  promise = new Promise executor
  expect(executor.mock.calls.length).toBe 1
  expect(typeof executor.mock.calls[0][0]).toBe 'function'
  expect(typeof executor.mock.calls[0][1]).toBe 'function'

test 'is in a PENDING state', ->
  promise = new Promise (fulfill, reject) ->
  expect(promise.state).toBe 'PENDING'

test 'transitions to the FULFILLED state with a value', ->
  value = 'pretty good frappuccino!'
  promise = new Promise (fulfill, reject) ->
    fulfill value
  expect(promise.state).toBe 'FULFILLED'

test 'transitions to the REJECTED state with a `reason`', ->
  reason = 'mehh, this is just ice :('
  promise = new Promise (fulfill, reject) ->
    reject reason
  expect(promise.state).toBe 'REJECTED'
