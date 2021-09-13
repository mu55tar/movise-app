import 'package:flutter/material.dart';
import 'package:move_app/ui/Accounts%20Screens/loginscreen.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key key}) : super(key: key);

  @override
  _RegesterScreenState createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
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
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset(
            'assets/log3.jpg',
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          )),
          Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    Text("Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: TextField(
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: InputDecoration(
                            hintText: "User Name",
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                              suffixIcon: IconButton(
                                onPressed: _togglepass,
                                icon: isHidenPass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              )),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: TextField(
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                          decoration: InputDecoration(
                              hintText: "confarm Password",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: _togglepass,
                                icon: isHidenPass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              )),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: double.maxFinite,
                      color: Colors.red[700],
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "REGESTER",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ]));
  }
}
