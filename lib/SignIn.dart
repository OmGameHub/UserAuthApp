import 'package:flutter/material.dart';

import 'SignUp.dart';
import 'MyHomePage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void onPressSignIn()
  {
    String email = emailController.text.trim(); 
    String pass = passController.text.trim(); 

    if (email == "om@gmail.com" && pass == "1234") 
    {
      // go to home screen
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => MyHomePage("Om", email))
      );
    }
  }

  void onPressSignUp()
  {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => SignUp())
    );
  }

  Widget inputField(controller, hintText, obscureText, keyboardType, iconName) => 
  TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(iconName, color: Colors.blue),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white70),
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.blue)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.blue)
      ),
    ),
  );

  Widget myBtn(text, onPressed) => 
  MaterialButton(
    color: Colors.blue,
    padding: EdgeInsets.all(10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20, 
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    ),
    onPressed: onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 32, top: 64, right: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Image(
                height: 50,
                image: AssetImage('assets/flutter.png'),
                alignment: Alignment.centerLeft,
              ),

              SizedBox(height: 16),

              Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 28, 
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 8),

              Text(
                "Sign in to continue",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 48),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    // username field
                    inputField(emailController, "Username", false, TextInputType.emailAddress, Icons.person),

                    SizedBox(height: 16),

                    // password field
                    inputField(passController, "Password", true, TextInputType.text, Icons.lock),

                    SizedBox(height: 32),

                    myBtn("Login", onPressSignIn),

                    Container(
                      height: 2, 
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 16),
                    ),

                    myBtn("Create account", onPressSignUp),

                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    "Created by OM with ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Icon(
                    Icons.favorite,
                    size: 24,
                    color: Colors.red,
                  ),
                  
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}