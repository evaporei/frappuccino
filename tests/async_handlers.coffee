Promise = require '../src/'

test 'if a handler returns a promise, the previous promise should adopt the state of the returned promise', ->
  value = 'goodppuccino'
  f1 = jest.fn()
  new Promise (fulfill) -> fulfill()
    .then -> new Promise (resolve) -> resolve value
    .then f1
  expect(f1.mock.calls.length).toBe 1
  expect(f1.mock.calls[0][0]).toBe value

test 'if a handler returns a promise resolved in the future, the previous promise should adopt it\'s value', (done) ->
  value = 'goodppuccino'
  f1 = jest.fn()
  new Promise (fulfill) -> setTimeout fulfill, 0
    .then -> new Promise (resolve) -> setTimeout resolve, 0, value
    .then f1
  setTimeout ( ->
    expect(f1.mock.calls.length).toBe 1
    expect(f1.mock.calls[0][0]).toBe value
    done()
  ), 10
