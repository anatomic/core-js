{module, test} = QUnit
module \ES6

test 'Date#toISOString' (assert)!->
  {toISOString} = core.Date
  assert.isFunction toISOString
  assert.strictEqual toISOString(new Date 0), '1970-01-01T00:00:00.000Z'
  assert.strictEqual toISOString(new Date 1e12+1), '2001-09-09T01:46:40.001Z'
  assert.strictEqual toISOString(new Date -5e13-1), '0385-07-25T07:06:39.999Z'
  ft = toISOString new Date 1e15+1
  assert.ok(ft is '+033658-09-27T01:46:40.001Z' or ft is '33658-09-27T01:46:40.001Z')
  bc = toISOString new Date -1e15+1
  assert.ok(bc is '-029719-04-05T22:13:20.001Z' or bc is '-29719-04-05T22:13:20.001Z')
  assert.throws (!-> toISOString new Date NaN), RangeError