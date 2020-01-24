import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  void onPressSignUp() 
  {
    String name = nameController.text.trim(); 
    String email = emailController.text.trim(); 
    String pass = passController.text.trim(); 
    String confPass = confPassController.text.trim(); 

    if (
      name.isNotEmpty && 
      email.isNotEmpty && 
      pass.isNotEmpty && 
      confPass.isNotEmpty
    ) 
    {
      if (RegExp('^((?=.*[A-Z])(?=.*[0-9].{2}))(?=.{10,})').hasMatch(pass)) 
      {
        if (pass == confPass) 
        {
          // go to home screen
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => MyHomePage(
              nameController.text.trim(),
              emailController.text.trim(),
            ))
          );
        }
      }
    }
  }

  void onPressSignIn()
  {
    Navigator.pop(context);
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
        fontSize: 18, 
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 32, top: 64, right: 32, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Image(
                  height: 50,
                  image: AssetImage('assets/flutter.png'),
                  alignment: Alignment.centerLeft,
                ),

                SizedBox(height: 32),

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
                  "Create new account",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 32),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    // name field
                    inputField(nameController, "Name", false, TextInputType.emailAddress, Icons.person),

                    SizedBox(height: 16),

                    // username field
                    inputField(emailController, "Email", false, TextInputType.emailAddress, Icons.email),

                    SizedBox(height: 16),

                    // password field
                    inputField(passController, "Password", true, TextInputType.text, Icons.lock),

                    SizedBox(height: 16),

                    // confirm password field
                    inputField(confPassController, "Confirm Password", true, TextInputType.text, Icons.lock),

                    SizedBox(height: 32),

                    myBtn("Sign Up", onPressSignUp),

                    Container(
                      height: 2, 
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 16),
                    ),

                    myBtn("Already have a account Login", onPressSignIn),

                  ],
                ),

                SizedBox(height: 32),

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
      ),
    );
  }
}