import 'package:flutter/material.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {

  final String name;
  final String email;
  final File _image;

  ProfilePage(this.name, this.email, this._image);

  @override
  _ProfilePageState createState() => _ProfilePageState(this.name, this.email, this._image);
}

class _ProfilePageState extends State<ProfilePage> {

  final String name;
  final String email;
  final File _image;

  _ProfilePageState(this.name, this.email, this._image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.blue,
                    backgroundImage: _image == null?
                      NetworkImage(
                        'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                      ) : FileImage(_image),
                  ),

                  Container(height: 48,),

                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  Container(height: 8,),

                  Text(
                    email,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),

                  Container(height: 48,),

                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Text(
                              "12.5K",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "Projects",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Text(
                              "360K",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "Applications",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Text(
                              "650",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "Repo",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  Container(height: 64),

                  MaterialButton(
                    color: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Follow Now",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}