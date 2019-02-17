import 'package:flutter/material.dart';
import 'register.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return new LoginState();
  }
}


class LoginState extends State<Login> {
  BuildContext con;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextFormField userid() {
    return TextFormField(
      controller: user,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: "User ID",
        hintText: "Please input your email",
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => print(value),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: pass,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Password",
        hintText: "Please input your password",
      ),
      keyboardType: TextInputType.text,
      onSaved: (value) => print(value),
      obscureText: true,
    );
  }

  Row register() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text("Register New Account",
              style: TextStyle(
                color: Colors.pink,
              )),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
          },
        ),
      ],
    );
  }

  RaisedButton loginButton() {
    return RaisedButton(
      child: Text("LOGIN", style: TextStyle(color: Colors.pink)),
      onPressed: () {
        if (user.text == '' || pass.text == '') {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("กรุณาระบุ user or password"),
          ));
        } else if ("admin" == user.text &&
            "1234" == pass.text) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("user or password ไม่ถูกต้อง"),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      key:_scaffoldKey,
        body: Form(
      key: _formKey,
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: <Widget>[
            
            Image.asset(
              "assets/img/bg_login.jpg",
              height: 200,
              width: 200,
            ),
            userid(),
            password(),
            loginButton(),
            register()
          ],
        ),
      ),
    ));
  }
}
