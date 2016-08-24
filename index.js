'use strict';

// Initializers
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('./namegen.db');


// Public API
module.exports = {
    findRandomSurname: function(callback) {
        db.get('SELECT name FROM surnames ORDER BY RANDOM() LIMIT 1', callback);
    },

    findRandomMaleName: function(callback) {
        db.get('SELECT (SELECT name FROM forenames_male ORDER BY RANDOM() LIMIT 1) AS forename, (SELECT name FROM surnames ORDER BY RANDOM() LIMIT 1) AS surname', callback);
    },

    findRandomFemaleName: function(callback) {
        db.get('SELECT (SELECT name FROM forenames_female ORDER BY RANDOM() LIMIT 1) AS forename, (SELECT name FROM surnames ORDER BY RANDOM() LIMIT 1) AS surname', callback);
    },

    findRandomMaleForename: function(callback) {
    	db.get('SELECT name FROM forenames_male ORDER BY RANDOM() LIMIT 1', callback);
    },

    findRandomFemaleForename: function(callback) {
        db.get('SELECT name FROM forenames_female ORDER BY RANDOM() LIMIT 1', callback);
    },

    // Returns db handler. Use only as last resort.
    _getDB:function() {
        return db;
    }
};
