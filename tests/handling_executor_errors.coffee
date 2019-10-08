Promise = require '../src/'

test 'when the executor fails, the promise should transition to the REJECTED state', (done) ->
  reason = new Error 'bad frappuccino'
  onRejected = jest.fn()
  promise = new Promise (fulfill, reject) ->
    throw reason
  promise.then null, onRejected

  setTimeout (->
    expect(onRejected.mock.calls.length).toBe 1
    expect(onRejected.mock.calls[0][0]).toBe reason
    expect(promise.state).toBe 'REJECTED'
    done()
  ), 5
