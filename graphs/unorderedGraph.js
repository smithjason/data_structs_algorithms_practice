function Vertex(label){
  this.label = label;
}

function Graph(numVertices){
  this.vertices = numVertices;
  this.adjacencyList = [];
  this.edges = 0;

  for(var i = 0; i < this.vertices; ++i){
    this.adjacencyList[i] = [];
    this.adjacencyList[i].push("");
  }
}

Graph.prototype = {
  addEdge: function(vertexA, vertexB){
    this.adjacencyList[vertexA].push(vertexB);
    this.adjacencyList[vertexB].push(vertexA);
    this.edges++;
  },
  showGraph: function(){
    for(var i = 0; i < this.vertices; i++){
      process.stdout.write(i + " -> ");
      for(var j = 0; j < this.vertices; j++){
        if(this.adjacencyList[i][j] != undefined){
          process.stdout.write(this.adjacencyList[i][j] + ' ');
        }
      }
      console.log();
    }
  }
}
