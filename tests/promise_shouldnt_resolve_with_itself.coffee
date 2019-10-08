Promise = require '../src/'

test 'should throw when attempted to be resolved with itself', (done) ->
  r1 = jest.fn()
  p = new Promise (fulfill) -> fulfill()
  q = p.then -> q
  q.then null, r1

  setTimeout ( ->
    expect(r1.mock.calls.length).toBe 1
    expect(r1.mock.calls[0][0] instanceof TypeError).toBe true
    done()
  ), 50
