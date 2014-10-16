function Graph(numVertices){
  this.vertices = numVertices;
  this.adjacencyList = [];
  this.visitedVerts = [];
  this.edges = 0;

  for(var i = 0; i < this.vertices; ++i){
    this.adjacencyList[i] = [];
  }

  for(var i = 0; i < this.vertices; ++i){
    this.visitedVerts[i] = false;
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
  },
  dfs: function(vertex){
    var self = this;
    this.visitedVerts[vertex] = true;
    if(this.adjacencyList[vertex] != undefined)
      console.log("Visited vertex: " + vertex);
    this.adjacencyList[vertex].forEach(function(element){
      if(!self.visitedVerts[element]){
        self.dfs(element);
      }
    });
  }
}

var graph = new Graph(5);
graph.addEdge(0,1);
graph.addEdge(0,2);
graph.addEdge(1,3);
graph.addEdge(2,4);
graph.showGraph();
