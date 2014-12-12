function Node(value){
  this.value = value;
  this.children = [];
  this.parent = null;
}

Node.prototype = {
  setParentNode: function(node){
    this.parent = node;
  },
  getParentNode: function(){
    return this.parent;
  },
  addChild: function(node){
    node.setParentNode(this);
    this.children[this.children.length] = node;
  },
  getChildren: function(){
    return this.children;
  },
  removeChildren: function(){
    this.children = [];
  }
};

var largestSumPossible = function(array){

};

console.log(largestSumPossible([10,250,3,7,600]));
