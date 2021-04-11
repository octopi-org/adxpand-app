import 'package:flutter/material.dart';
import 'package:applify/login/login.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  ForgotPasswordPageState createState() => new ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 128, 255, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {Navigator.pop(context, true);}
        )
      ),
      backgroundColor: Color.fromRGBO(0, 128, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.040,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Lin Tze En ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Beta 0.01",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ]
                      )
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5
                      ),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value.trim(),
                        cursorColor: Color.fromRGBO(32, 95, 38, 1),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color.fromRGBO(32, 95, 38, 1),
                          ),
                          hintText: 'Enter your email',
                          border: InputBorder.none,
                        ),
                      )
                    ),
                    ResetButton(
                      title: "RESET PASSWORD",
                      callback: resetPassword,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    )
                  ]
                )
              ),
              SizedBox(
                height: size.height * 0.225,
              ),
              Image.asset('assets/company-logo.png')
            ]
          )
        )
      ),
    );
  }

  //Functions below

  Future<void> resetPassword() async {
    try {
      // send to database
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new Login())
      );
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: Text("Success"),
                content: Text("Reset password email sent."),
              ));
    } catch(e) {
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: Text("ERROR"),
                content: Text(e.message),
              ));
    }
  }
}

class ResetButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const ResetButton({Key key, this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color.fromRGBO(0, 128, 255, 1) ,
              onPressed: callback,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
    );
  }
}