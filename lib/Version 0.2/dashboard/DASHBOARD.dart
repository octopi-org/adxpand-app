import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:applify/Version 0.2/db/new-db.dart';
import 'package:applify/Version 0.2/models/note.dart';

class rainbowdashboard extends StatefulWidget {
  @override
  _rainbowdashboardState createState() => _rainbowdashboardState();
}

class _rainbowdashboardState extends State<rainbowdashboard> {
  /*
  List<UserModel> cards;
  bool isLoading = false;
  List detail = [
    "search_impression_share",
    "search_exact_match_impression_share",
    "search_rank_lost_impression_share",
    "search_budget_lost_top_impression_share",
    "search_budget_lost_absolute_top_impression_share",
    "all_conversions_from_int_rate"
  ];

   */

  @override
  void initState() {
    super.initState();

    //refreshCards();
  }

  @override
  void dispose() {
    //UserDBProvider.db.close();

    super.dispose();
  }
/*
  Future refreshCards() async {
    setState(() => isLoading = true);

    this.cards = await UserDBProvider.db.readAll();

    setState(() => isLoading = false);
  }


 */
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Dashboard',
          style: TextStyle(fontSize: 24),
        ),
        actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(106, 145, 254, 1),
                    Color.fromRGBO(89, 129, 245, 1),
                  ]
              )
          ),
          child: Center(
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(height: size.width * 0.05),
                        PersonalBar(size: size),
                        SizedBox(height: size.width * 0.05),
                        SettingsBar(size: size),
                        SizedBox(height: size.width * 0.05),
                        DashboardInfo(size: size),
                      ]
                  )
              )
            /*
      child: isLoading
          ? CircularProgressIndicator()
          : cards.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )
          : buildNotes(),

       */
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          print('works');
        },
        /*() async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditNotePage()),
        );

        refreshNotes();

           */
      ),
    );
  }
/*
  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: kards.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final kard = kards[index];

      return GestureDetector(
        onTap: () async {
          /*
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CardDetailPage(noteId: card.id),
          ));

          refreshCards();
          */
          print('Successful gesture detection.');
        },
        child: NoteCardWidget(kard: kard, index: index),
      );
    },
  );

 */
}

class PersonalBar extends StatelessWidget {
  final String name = 'Jason Tham';
  final String email = 'thamjsonyc@globaltutorsg.org';
  final Size size;
  const PersonalBar({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.height * 0.25,
        width: size.width * 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.01),
                      child: Text(email, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    SizedBox(
                        width: size.width * 0.25
                    ),
                    Container(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Icon(Icons.more_horiz, size: 30)
                    ),
                  ]
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: Text(name, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 28)),
                //padding: EdgeInsets.only(top: 8, left: 20),
              ),
              SizedBox(
                height: size.height * 0.07
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Text('Connect to Google Ads now', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(width: size.width * 0.25),
                      Icon(Icons.arrow_forward_ios),
                    ]
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}

class SettingsBar extends StatelessWidget {
  final Size size;
  const SettingsBar({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            width: size.width * 0.8,
            height: size.width * 0.09,
            child: Text('Manage Account Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlue))
          ),
          SizedBox(height: size.width * 0.02),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: size.width * 0.8,
              height: size.width * 0.09,
              child: Text('Review Account Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.lightBlue))
          ),
        ]
      )
    );
  }
}

class DashboardInfo extends StatelessWidget {
  final Size size;
  const DashboardInfo({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(child: Text(kards[0].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                ),
                Center(
                  child: Container(
                    width: size.width * 0.3,
                    height: size.width * 0.15,
                    child: Text(kards[0].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                  )
                )
              ]
            ),
            Column(
                children: [
                  Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                      ),
                    child: Center(child: Text(kards[1].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                  ),
                  Center(
                      child: Container(
                        width: size.width * 0.3,
                        height: size.width * 0.15,
                        child: Text(kards[1].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                      )
                  )
                ]
            ),
            Column(
                children: [
                  Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                    child: Center(child: Text(kards[2].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                  ),
                  Center(
                      child: Container(
                        width: size.width * 0.3,
                        height: size.width * 0.15,
                        child: Text(kards[2].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                      )
                  )
                ]
            ),
          ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  children: [
                    Container(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      child: Center(child: Text(kards[3].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                    Center(
                        child: Container(
                          width: size.width * 0.3,
                          height: size.width * 0.15,
                          child: Text(kards[3].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                        )
                    )
                  ]
              ),
              Column(
                  children: [
                    Container(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      child: Center(child: Text(kards[4].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                    Center(
                        child: Container(
                          width: size.width * 0.3,
                          height: size.width * 0.15,
                          child: Text(kards[4].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                        )
                    )
                  ]
              ),
              Column(
                  children: [
                    Container(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      child: Center(child: Text(kards[5].detail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                    Center(
                        child: Container(
                          width: size.width * 0.3,
                          height: size.width * 0.15,
                          child: Text(kards[5].title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white), softWrap: true),
                        )
                    )
                  ]
              ),
            ]
        ),
      ]
    );
  }
}