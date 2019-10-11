Promise = require '../src/'

test 'should queue callbacks when the promise is not fulfilled immediately', (done) ->
  value = 'frappuccino, more like frappugood'
  promise = new Promise (fulfill, reject) ->
    setTimeout fulfill, 1, value

  onFulfilled = jest.fn()

  promise.then onFulfilled

  expect(onFulfilled.mock.calls.length).toBe 0

  setTimeout ->
    expect(onFulfilled.mock.calls.length).toBe 1
    expect(onFulfilled.mock.calls[0][0]).toBe value
    promise.then onFulfilled
  , 50

  setTimeout ->
    expect(onFulfilled.mock.calls.length).toBe 2
    expect(onFulfilled.mock.calls[1][0]).toBe value
    done()
  , 100

test 'should queue callbacks when the promise is not rejected immediately', (done) ->
  value = 'frappuccino, more like frappubad'
  promise = new Promise (fulfill, reject) ->
    setTimeout reject, 1, value

  onRejected = jest.fn()

  promise.then null, onRejected

  expect(onRejected.mock.calls.length).toBe 0

  setTimeout ->
    expect(onRejected.mock.calls.length).toBe 1
    expect(onRejected.mock.calls[0][0]).toBe value
    promise.then null, onRejected
  , 50

  setTimeout ->
    expect(onRejected.mock.calls.length).toBe 2
    expect(onRejected.mock.calls[1][0]).toBe value
    done()
  , 100
