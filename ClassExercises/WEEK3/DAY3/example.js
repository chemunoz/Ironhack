'use strict';

var bar = 'hi';

var printBar = function() {
  console.log(this.bar);
}

var test = {
  bar: 'yo',
  foo: printBar
}

new test.foo();
test.foo();

delete test.bar;
test.foo();
printBar();
