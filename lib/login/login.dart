import 'package:applify/Version%200.2/db/db.dart';
import 'package:applify/login/forgot-password.dart';
import 'package:flutter/material.dart';
import 'package:applify/Version 0.2/HOME.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:applify/Version 0.2/models/userModel.dart';

class Login extends StatefulWidget {
  final UserModel userModel;

  const Login({Key key, this.userModel}) : super(key:key);

  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  bool oldUser = false;
  String stateManager = '';
  String email = '';
  String password = '';
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  void dispose() {
    UserDBProvider.db.close();
    // Clean up the controller when the widget is removed from the
    // widget tree.
    passwordController.dispose();
    super.dispose();
  }

  Future readDb() async {
    if (UserDBProvider.db.readAllCards() != null) {
      oldUser = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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

  Future<void> signIn() async{
    password = passwordController.text;
    // String user = _isIt2021(email, password);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage(user)));
    //await _fetchName();
    stateManager = 'success';
    if (stateManager == "success") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      _showAlertDialog("Unsuccessful", "Incorrect username or password.");
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

  Future _fetchName() async{
    List<UserModel> firstRead;
    //double read0, read1, read2, read3, read4, read5, read6, read7, read8;

    final queryParameters = {
      'email': '$email',
      'password': '$password',
    };
    final uri = Uri.https('betatest-api.herokuapp.com', '/appgetview', queryParameters);
    //final response = await http.get(link, headers: {"x-api-key": WasteLessData.userKey});
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      //return json.decode(response.body)["username"].toString();
      print(response.statusCode);
      stateManager = jsonDecode(response.body)['status'];
      firstRead = (jsonDecode(response.body)['data'] as List).map((dict) => UserModel.fromMapNew(dict)).toList();
      //print((jsonDecode(response.body)['data'] as List)[0]);
      await UserDBProvider.db.createNewCopy(firstRead[0]);
    } else {
      throw Exception('Failed to load data');
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
