import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:move_app/ui/Accounts%20Screens/regesterScreen.dart';
import 'package:move_app/ui/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidenPass = true;
  void _togglepass() {
    setState(() {
      isHidenPass = !isHidenPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/log3.jpg',
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          )),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text("Welcom Back !",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                  SizedBox(height: 20),
                  Text("Sign in to your account",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(color: Colors.black54),
                      child: TextField(
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(color: Colors.black54),
                      child: TextField(
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                            //
                            suffixIcon: IconButton(
                              onPressed: _togglepass,
                              icon: isHidenPass
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            )),
                        obscureText: isHidenPass,
                        keyboardType: TextInputType.visiblePassword,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    minWidth: double.maxFinite,
                    color: Colors.red[700],
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account? ",
                          style: TextStyle(
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          child: Text(
                            "sign up",
                            style: TextStyle(
                                color: Colors.red[700],
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegesterScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 50),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Google",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Facebook",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
