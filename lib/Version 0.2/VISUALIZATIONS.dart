import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:applify/Version 0.2/visualization-classes.dart';
import 'dart:math';

class MyVisualisationsPage extends StatefulWidget {
  @override
  _MyVisualisationsPageState createState() => _MyVisualisationsPageState();
}

class _MyVisualisationsPageState extends State<MyVisualisationsPage> {
  final edgeList = findEdges(adjacencyMatrix);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(106, 145, 254, 1),
                  Color.fromRGBO(75, 117, 235, 1),
                ]
            )
          ),
          child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: Container(
                    child: GraphView(
                      graph: graph,
                      algorithm: builder,
                      paint: Paint()
                        ..color = Colors.green
                        ..strokeWidth = 1
                        ..style = PaintingStyle.stroke,
                      builder: (Node node) {
                        // I can decide what widget should be shown here based on the id
                        var a = node.key.value as int;
                        return rectangleWidget(a);
                      },
                    )
                  )
          ),
        )
    );
  }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }

  final Graph graph = Graph();
  FruchtermanReingoldAlgorithm builder;

  @override
  void initState() {
    edgeList.forEach((edgePair) {
      graph.addEdge(Node.Id(edgePair[0]),Node.Id(edgePair[1]));
    });

    builder = FruchtermanReingoldAlgorithm(iterations: 1000);
  }
}

//top left:
//dropdown of dropdowns: priorization, nodes, edges
//nodes and edges are metrics, prioritization kiv
//help