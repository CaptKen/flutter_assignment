import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  var new_user_id = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextFormField new_user() {
    return TextFormField(
      controller: new_user_id,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: "Email",
        hintText: "sample@email.com",
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField password1() {
    return TextFormField(
      controller: pass2,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Password",
        hintText: "Input your password",
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  TextFormField password2() {
    return TextFormField(
      controller: pass1,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: "Confirm Password",
        hintText: "Input your password",
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }

  RaisedButton register() {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      splashColor: Colors.pink,
      child: Text(
        "Continue",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        if(new_user_id.text == "admin"){
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("user นี้มีอยู่ในระบบแล้ว"),
          ));
        }
        else if (pass1.text == pass2.text && new_user_id.text != "") {
          Navigator.pop(context);
        }else if(pass1.text == "" || pass2.text == "" || new_user_id.text == ""){
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
            )
          );
        }else if(pass1.text != pass2.text && new_user_id.text != ""){
          _scaffoldKey.currentState.showSnackBar(
            new SnackBar(
              content: Text("รหัสผ่านทั้งสองช่องไม่ตรงกัน"),
            )
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("REGISTER"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  new_user(),
                  password1(),
                  password2(),
                  register(),
                ]),
          ),
        ));
  }
}
