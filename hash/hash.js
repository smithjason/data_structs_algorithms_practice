function HashTable() {
  this.KEY = 0;
  this.VALUE = 1;
  this.table = new Array(137);
  this.buildChains();
}

/*
Determining Hash Function
*/
HashTable.prototype = {
  buildChains: function(){
    for(var i = 0; i < this.table.length; ++i){
      this.table[i] = new Array();
    }
  },
  //MODULAR HASHING WAY
  /*
  MODULAR HASHING
  Array size should always be a prime number
    - Why? Because it will more evenly distribute the keys
  Key is:
    - Integer: key % size of array
        Good when:
        Bad when:
          - keys all end in 0
          - array size is 10
  */
  simpleHash: function(data){
    var total = 0;
    for(var i = 0; i < data.length; i++){
      total += data.charCodeAt(i);
    }

    return total % this.table.length;
  },
  // STRING HASHING USING Horner's Method
  /*
  A BETTER HASH FUNCTION
  Make sure array size > 100 && prime
  Horner's Method
    Same as modular but * Sum by Prime # Constant
      recommended a small prime #
  */
  betterHash: function(key){
    var primeHashMultiplier = 37;
    var total = 0;
    for(var i = 0; i < key.length; ++i){
      total += primeHashMultiplier * total + key.charCodeAt(i);
    }

    total = total % this.table.length;

    if(total < 0){
      total += this.table.length - 1;
    }

    return parseInt(total);
  },
  showDistro: function(){
    var n = 0;
    for(var i = 0; i < this.table.length; ++i){
      if(this.table[i][0] != undefined){
        console.log(i + ': ' + this.table[i]);
      }
    }
  },
  put: function(key, data){
    var pos = this.betterHash(key);
    var index = 0;
    if(this.table[pos][index] == undefined){
      this.table[pos][index] = [key, data];
    }
    else {
      while(this.table[pos][index] != undefined && this.table[pos][index][this.KEY] != key){
        index++;
      }
      this.table[pos][index] = [key, data];
    }
  },
  get: function(key){
    var index = 0;
    var pos = this.betterHash(key);

    if(this.table[pos][index][this.KEY] == key){
      return this.table[pos][index][this.VALUE];
    }
    else {
      while(this.table[pos][index][this.KEY] != key){
        index++;
      }
      return this.table[pos][index][this.VALUE];
    }
    return undefined;
  }
}

var names = ['David','Jennifer','Donnie','Raymond',
            'Cynthia','Mike','Clayton','Danny','Jonathan'];

var hash = new HashTable();

for(var i = 0; i < names.length; ++i){
  hash.put(names[i], i);
}
