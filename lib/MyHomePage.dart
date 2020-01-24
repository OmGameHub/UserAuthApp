import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:io';

import 'ProfilePage.dart';

class MyHomePage extends StatefulWidget {

  final String name;
  final String email;

  MyHomePage(this.name, this.email);

  @override
  _MyHomePageState createState() => _MyHomePageState(this.name, this.email);
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _homePageKey = new GlobalKey<ScaffoldState>();

  String name;
  String email;
  File _image;

  bool isDarkThemeEnable = false;

  _MyHomePageState(this.name, this.email);

  void toggleTheme(bool value) 
  {
    setState(() {
      isDarkThemeEnable = value;

      if(isDarkThemeEnable)
      {
        DynamicTheme.of(context).setBrightness(Brightness.dark);
        DynamicTheme.of(context).setThemeData(ThemeData.dark());
      }
      else
      {
        DynamicTheme.of(context).setBrightness(Brightness.light);
        DynamicTheme.of(context).setThemeData(ThemeData.light());
      }
    });
    
  }

  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void openProfile() 
  {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context)  => ProfilePage(name, email, _image)
      )
    );
  }

  Widget myDrawer() =>
  Drawer(
    child: ListView(
      children: <Widget>[

        DrawerHeader(
          child: Row(
            children: <Widget>[

              CircleAvatar(
                radius: 45,
                backgroundImage: _image == null?
                  NetworkImage(
                    'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                  ) : FileImage(_image),
              ),

              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Hello, $name",
                      style: TextStyle(fontSize: 14),
                    ),

                    Text(
                      email,
                      style: TextStyle(fontSize: 12),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Favorite Apps",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Divider(),

        Container(
          padding: EdgeInsets.only(left: 16, bottom: 32),
          child: Column(
            children: <Widget>[

              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: getCameraImage,
              ),

              ListTile(
                leading: Icon(Icons.photo),
                title: Text("Gallery"),
                onTap: getGalleryImage,
              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: openProfile,
              ),
              
            ],
          ),
        ),


        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Divider(),

        Container(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            children: <Widget>[

              ListTile(
                title: Text("Dark Mode"),
                trailing: Switch(
                  value: isDarkThemeEnable,
                  onChanged: (bool value) => toggleTheme(value) , 
                ),
              ),
              
            ],
          ),
        ),

        ListTile(
          trailing: Text("Back"),
          onTap: () => Navigator.pop(context),
        ),

      ],
    ),
  );

  Widget myContactBtn(text, textColor, bgColor, onPressed) =>
  MaterialButton(
    color: bgColor,
    elevation: 5,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14, 
        color: textColor, 
        fontWeight: FontWeight.bold
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    onPressed: onPressed,
  );
  
  Widget myFavoriteBtn(iconName, iconColor) =>
  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40)
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      child: Icon(
        iconName, 
        color: iconColor
      ),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homePageKey,
      drawer: myDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[

            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Image.network(
                      'https://images.pexels.com/photos/1719995/pexels-photo-1719995.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Expanded(flex: 2, child: Container(),)
                ],
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.yellow,
                            size: 54,
                          ),

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Text(
                                    "Its now 18°C",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),

                                  Text("In Jaipur"),

                                ],
                              ),
                            ),
                          ),


                          FloatingActionButton(
                            heroTag: 'navigation',
                            elevation: 0,
                            backgroundColor: Colors.lightBlue,
                            child: Icon(Icons.navigation, color: Colors.white),
                            onPressed: () {},
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      myFavoriteBtn(Icons.local_movies, Colors.blue),

                      myFavoriteBtn(Icons.calendar_today, Colors.green),

                      myFavoriteBtn(Icons.music_note, Colors.red),

                      myFavoriteBtn(Icons.event_note, Colors.purple),


                    ],
                  ),

                  Container(height: 16),

                  Text(
                    "Friday, Jan 10",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  
                  Container(height: 8),

                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: TextStyle(fontSize: 14),
                  ),

                  Container(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      myContactBtn(
                        "Call", 
                        Colors.white,
                        Colors.blue,
                        () => launch("tel://21213123123"),
                      ),

                      myContactBtn(
                        "Text", 
                        Colors.white,
                        Colors.indigo,
                        () => launch("sms:5550101234"),
                      ),

                      myContactBtn(
                        "Email", 
                        Colors.white,
                        Colors.lime,
                        () => launch("mailto:smith@example.org?subject=News&body=New%20plugin"),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          
            SafeArea(
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: ()=> _homePageKey.currentState.openDrawer(),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}