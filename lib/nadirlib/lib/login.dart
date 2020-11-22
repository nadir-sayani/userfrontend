import 'package:flutter/material.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Camera/camera.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Camera/camera.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MaterialApp(home: LoginPage(),debugShowCheckedModeBanner: false,));

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}*/

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          //children: new Column(

              children: <Widget>[
                Padding(padding: EdgeInsets.all(60),),
                CircleAvatar(/*backgroundImage: AssetImage('images/juggler.png'),*/minRadius: 60,backgroundColor: Colors.grey,),
                //InkWell(child: Icon(Icons.camera),onTap: ()=>UserOptions(),),
                TextFormField(decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name'),),
                TextFormField(decoration: const InputDecoration(
                    icon: const Icon(Icons.verified_user),
                    hintText: 'Enter your password',
                    labelText: 'Password'),),
                Padding(padding: EdgeInsets.all(60),),
                new MaterialButton(
                  height: 50.0,
                  minWidth: 50.0,
                  color: Colors.green,
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                  // child: new Icon(FontAwesomeIcons.signInAlt),
                  child: Text("Log In"),
                  onPressed: () {},)


              ]
          ),
        );

  }
}