Promise = require '../src/'

test 'works with invalid handlers (fulfill)', ->
  value = 'niceppuccino'
  f1 = jest.fn()

  p = new Promise (fulfill) -> fulfill value
  q = p.then null
  q.then(f1)

  expect(f1.mock.calls.length).toBe 1
  expect(f1.mock.calls[0][0]).toBe value

test 'works with invalid handlers (reject)', ->
  reason = 'horrorppuccino'
  r1 = jest.fn()

  p = new Promise (fulfill, reject) -> reject reason
  q = p.then null, null
  q.then(null, r1)

  expect(r1.mock.calls.length).toBe 1
  expect(r1.mock.calls[0][0]).toBe reason
