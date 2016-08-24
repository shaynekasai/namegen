# Namegen

This is a Node.js module that allows you to generate a random name using US census data and SQLite.

# Usage

```javascript
var namegen = require('namegen');
namegen.findRandomFemaleName(function(err, result) {
    console.log(result);
});
```

# Available methods

findRandomSurname(callback)
---
findRandomMaleName(callback)
---
findRandomFemaleName(callback)
---
findRandomMaleForename(callback)
---
findRandomFemaleForename(callback)
---

`callback` gets called with two parameters: err, and result


# Importer

namegen.db is already populated, but if you need to re-import, or you wanted to modify the importer,
everything is located in the import folder including the census data. 

import.sh - run this to execute the import. all tables will be dropped
import.sql - the sql script that includes import commands based on the raw data in the same folder