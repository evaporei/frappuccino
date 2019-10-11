Promise = require '../src/'

test 'rejects with a resolved promise', (done) ->
  value = 'frappawesome'
  reason = new Promise (fulfill) -> fulfill value

  r1 = jest.fn()
  p = new Promise (fulfill) -> fulfill()
    .then -> throw reason
    .then null, r1

  expect(r1.mock.calls.length).toBe 0

  setTimeout ->
    expect(r1.mock.calls.length).toBe 1
    expect(r1.mock.calls[0][0]).toBe reason
    done()
  , 50

