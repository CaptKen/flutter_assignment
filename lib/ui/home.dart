import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int index = 0;
  List tabs = [
    Text("Home"),
    Text("Notify"),
    Text("Map"),
    Text("Profile"),
    Text("Setup")
  ];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME", textAlign: TextAlign.center,),
          // bottom:
        ),
        body: Center(
          child: tabs[index],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).accentColor,
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.view_quilt),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text("Notify"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.navigation),
                title: Text("Map"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setup"),
              )
            ],
            onTap: (int i) {
              setState(() {
                index = i;
              });
            },
          ),
        ),
      ),
    );
  }
}
