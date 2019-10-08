Promise = require '../src/'

test 'the promise observers are called after the event loop', (done) ->
  value = 'doppuccino'
  f1 = jest.fn()
  resolved = false

  p = new Promise (fulfill) ->
    fulfill value
    resolved = true
  
  p.then f1

  expect(f1.mock.calls.length).toBe 0

  setTimeout (->
    expect(f1.mock.calls.length).toBe 1
    expect(f1.mock.calls[0][0]).toBe value
    expect(resolved).toBe true
    done()
  ), 10
