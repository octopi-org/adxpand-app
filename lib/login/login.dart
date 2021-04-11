import 'package:applify/login/forgot-password.dart';
import 'package:flutter/material.dart';
import 'package:applify/home.dart';


class Login extends StatefulWidget {

  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  String email, password;
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage('assets/company-logo.png'), fit: BoxFit.fill))
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Center(


                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        height: size.height *0.15,
                      ),

                      Container(
                        width: size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[


                            SizedBox(
                              height: size.height *0.040 ,
                            ),


                            Container(
                              alignment: Alignment.centerRight,
                              child: RichText(text: TextSpan(
                                  text: "amplify",
                                  style: TextStyle(
                                    fontSize: 75,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ".io",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )

                                  ]),
                              ),
                            ),


                            SizedBox(
                              height: size.height *0.03 ,
                            ),


                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Username:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35
                                  )
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) => email = value.trim(),
                                cursorColor: Color.fromRGBO(32, 95, 38, 1) ,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Color.fromRGBO(32, 95, 38, 1) ,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),


                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Password:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35
                                  )
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: passwordController,
                                autocorrect: false,
                                obscureText: _obscureText,
                                // onChanged: (value) => password = value,
                                cursorColor: Color.fromRGBO(32, 95, 38, 1) ,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock, color: Color.fromRGBO(32, 95, 38, 1),),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color.fromRGBO(32, 95, 38, 1) ,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toggle the state of passwordVisible variable
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Forgot your password? "),
                                GestureDetector(
                                  onTap: _forgetPassword,
                                  child: Text(
                                    "Get help signing in.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),


                            SizedBox(height: size.height * 0.02),


                            LoginButton(
                              title: "Login",
                              callback: signIn,
                            ),


                          ],
                        ),
                      ),


                    ], ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  void signIn() {
    password = passwordController.text;
    String user = _isIt2021(email, password);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage(user)));
    if (user == "1") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => new MyHomePage()));
    } else {
      _showAlertDialog("ERROR", "u fool");
      passwordController.clear();
    }
  }

  void _forgetPassword(){
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => new ForgotPasswordPage(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  void _showAlertDialog( String title, String message ) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

  _isIt2021(String email, String password) {
    if (email == "abc@d.com" && password == "password") {
      return "1";
    } else {
      return "0";
    }
  }

}



class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const LoginButton({Key key, this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.centerRight,
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color.fromRGBO(0, 0, 0, 0.35) ,
              onPressed: callback,
              child: Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
