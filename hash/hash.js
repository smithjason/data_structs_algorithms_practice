function HashTable() {
  this.table = new Array(137);
}

/*
Determining Hash Function
*/
HashTable.prototype = {
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
  betterHash: function(data){
    var primeHashMultiplier = 37;
    var total = 0;
    for(var i = 0; i < data.length; ++i){
      total += primeHashMultiplier * total + data.charCodeAt(i);
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
      if(this.table[i] != undefined){
        console.log(i + ': ' + this.table[i]);
      }
    }
  },
  put: function(key, data){
    var pos = this.betterHash(key);
    this.table[pos] = data;
  },
  get: function(key){
    var pos = this.betterHash(key);
    return this.table[pos];
  }
}

var names = ['David','Jennifer','Donnie','Raymond',
            'Cynthia','Mike','Clayton','Danny','Jonathan'];

var hash = new HashTable();
