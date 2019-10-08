Promise = require '../src/'

test '.then should return a new promise', ->
  expect(->
    qOnFulfilled = jest.fn()
    rOnFulfilled = jest.fn()
    promise = new Promise (fulfill, reject) -> fulfill()
    q = promise.then(qOnFulfilled)
    r = promise.then(rOnFulfilled)
  ).not.toThrow()

test 'if .then\'s onFulfilled is called without errors it should transition to FULFILLED', (done) ->
  value = 'ORANGE MOCHA FRAPPUCCINO!'
  f1 = jest.fn()
  new Promise (fulfill) -> fulfill()
    .then -> value
    .then f1

  setTimeout (->
    expect(f1.mock.calls.length).toBe(1)
    expect(f1.mock.calls[0][0]).toBe(value)
    done()
  ), 5

test 'if .then\'s onRejected is called without errors it should transition to FULFILLED', (done) ->
  value = 'ORANGE MOCHA FRAPPUCCINO!'
  f1 = jest.fn()
  new Promise (fulfill) -> reject()
    .then null, -> value
    .then f1

  setTimeout (->
    expect(f1.mock.calls.length).toBe(1)
    expect(f1.mock.calls[0][0]).toBe(value)
    done()
  ), 5

test 'if .then\'s onFulfilled is called and has an error it should transition to REJECTED', (done) ->
  reason = 'recipe failed :('
  f1 = jest.fn()
  new Promise (fulfill) -> fulfill()
    .then -> throw reason
    .then null, f1

  setTimeout (->
    expect(f1.mock.calls.length).toBe(1)
    expect(f1.mock.calls[0][0]).toBe(reason)
    done()
  ), 5

test 'if .then\'s onRejected is called and has an error it should transition to REJECTED', (done) ->
  reason = 'recipe failed :('
  f1 = jest.fn()
  new Promise (fulfill) -> reject()
    .then null, -> throw reason
    .then null, f1

  setTimeout (->
    expect(f1.mock.calls.length).toBe(1)
    expect(f1.mock.calls[0][0]).toBe(reason)
    done()
  ), 5
