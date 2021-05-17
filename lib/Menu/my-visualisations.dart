import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:applify/Menu/visualisation-classes.dart';
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
        body: InteractiveViewer(
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
              BoxShadow(color: Colors.blue[100], spreadRadius: 1),
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