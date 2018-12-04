import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  void _handleSignUp() async {
   FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: _usernameController.text,
      password: _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Auth'),
        ),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Text("Sign Up"),),
          Container(child: TextField(controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'email'
          ),)),
          SizedBox(height: 20.0,),
          Container(child: TextField(controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'password'
          ),
          )),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 45.0),
            child: RaisedButton(
              child: Text('Signup'),
              onPressed: (){
                _handleSignUp();
              },
            ),
          )
        ]));
  }
}
