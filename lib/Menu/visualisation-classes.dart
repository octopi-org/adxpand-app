import 'package:flutter/material.dart';

var adjacencyMatrix = [
  [0,1,1,1,0,0,0,0,0,0,0,0],
  [1,0,0,0,1,1,0,0,0,0,0,0],
  [1,0,0,0,0,0,0,0,0,0,0,0],
  [1,0,0,0,0,0,0,0,1,1,1,0],
  [0,1,0,0,0,0,0,0,0,0,0,0],
  [0,1,0,0,0,0,1,1,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,1],
  [0,0,0,0,0,0,0,0,0,0,1,0],
];

findNodes(adjMat) {
  var nodeList = [];
  adjMat.asMap().forEach((k,v) => nodeList.add(k+1));
  return nodeList;
}

findEdges(adjMat) {
  var idx1 = 0;
  var idx2 = 0;
  var edgeList = [];
  for (var row in adjMat) {
    idx1 += 1;
    idx2 = 0;
    for (var entry in row) {
      idx2 += 1;
      if (entry == 1) {
        if (edgeList.contains([idx2,idx1])) {
          break;
        }
        edgeList.add([idx1,idx2]);
      }
    }
  }
  return edgeList;
}

// dartpad code below

/*
var nodeList = [];
var edgeList = [];

var adjacencyMatrix = [
  [0,1,1,1,0,0,0,0,0,0,0,0],
  [1,0,0,0,1,1,0,0,0,0,0,0],
  [1,0,0,0,0,0,0,0,0,0,0,0],
  [1,0,0,0,0,0,0,0,1,1,1,0],
  [0,1,0,0,0,0,0,0,0,0,0,0],
  [0,1,0,0,0,0,1,1,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0,0,0,1],
  [0,0,0,0,0,0,0,0,0,0,1,0],
];

List findNodes(adjMat) {
  var nodeList = [];
  adjMat.asMap().forEach((k,v) => nodeList.add(k+1));
  return nodeList;
}

List findEdges(adjMat) {
  var idx1 = 0;
  var idx2 = 0;
  var edgeList = [];
  for (var row in adjMat) {
    idx1 += 1;
    idx2 = 0;
    for (var entry in row) {
      idx2 += 1;
      if (entry == 1) {
        if (edgeList.contains([idx2,idx1])) {
          break;
        }
        edgeList.add([idx1,idx2]);
      }
    }
  }
  return edgeList;
}

void main() {
  nodeList = findNodes(adjacencyMatrix);
  edgeList = findEdges(adjacencyMatrix);
  print(nodeList);

  for (var edgePair in edgeList) {
    print(edgePair[0].toString() + " is with " + edgePair[1].toString());
  }
}
*/