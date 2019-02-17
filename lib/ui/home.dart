import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
         appBar: AppBar(
          title: Text("Home",
          style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          color: Colors.pink,
          child: TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.navigation)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
       
        body: TabBarView(
          children: [
            Center(child: Text("Home",)),
            Center(child: Text("Notify")),
            Center(child: Text("Map")),
            Center(child: Text("Profile")),
            Center(child: Text("Setup")),
          ],
        ),
      ),
    );
  }
}