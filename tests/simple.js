var test = require('tape');
var namegen = require('../index.js');

test('get random female name', function(t) {
	namegen.findRandomFemaleName(function(err, result) {
	    t.equal(typeof result, 'object');
	    t.end();
	});
});

test('get random surname', function(t) {
	namegen.findRandomSurname(function(err, result) {
	    t.equal(typeof result, 'object');
	    t.end();
	});
});


test('get random male name', function(t) {
	namegen.findRandomMaleName(function(err, result) {
	    t.equal(typeof result, 'object');
	    t.end();
	});
});
