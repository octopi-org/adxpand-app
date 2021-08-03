import 'package:flutter/material.dart';
import 'package:applify/Version 0.2/models/userModel.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];
/*
class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key key,
    this.userModel,
    this.index,
    this.detail,
  }) : super(key: key);

  final UserModel userModel;
  final int index;
  final String detail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (detail == 'search_impression_share') Text(
              'Search Impression Share',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_impression_share') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'search_impression_share') Text(
              userModel.search_impression_share.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_exact_match_impression_share') Text(
              'Search Exact Match Impression Share',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_exact_match_impression_share') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'search_exact_match_impression_share') Text(
              userModel.search_exact_match_impression_share.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_rank_lost_impression_share') Text(
              'Search Rank Lost Impression Share',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_rank_lost_impression_share') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'search_rank_lost_impression_share') Text(
              userModel.search_rank_lost_impression_share.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_budget_lost_top_impression_share') Text(
              'Search Budget Lost Top Impression Share',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_budget_lost_top_impression_share') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'search_budget_lost_top_impression_share') Text(
              userModel.search_budget_lost_top_impression_share.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_budget_lost_absolute_top_impression_share') Text(
              'Search Budget Lost Absolute Top Impression Share',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'search_budget_lost_absolute_top_impression_share') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'search_budget_lost_absolute_top_impression_share') Text(
              userModel.search_budget_lost_absolute_top_impression_share.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'all_conversions_from_int_rate') Text(
              'All Conversions From Int Rate',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (detail == 'all_conversions_from_int_rate') SizedBox(
              height: size.height * 0.1,
            ),
            if (detail == 'all_conversions_from_int_rate') Text(
              userModel.all_conversions_from_int_rate.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
*/

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key key,
    this.kard,
    this.index,
  }) : super(key: key);

  final Kard kard;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kard.title.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              kard.detail.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}