import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbutton.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbuttontheme.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbuttontone.dart';*/
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbutton.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbuttontheme.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/DropDownButton/dropdownbuttontone.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/EditProfile/editprofile.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Settings/EditProfile/editprofile.dart';


void main(){
  runApp( new MaterialApp(home: Settings(),
    debugShowCheckedModeBanner: false,
  ));
}
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();}

class _SettingsState extends State<Settings> {
  String username="USER NAME";
  String email ="xyz@gmail.com";
  String numb="123456789";
  String organ="Haresh Patel";
  String addrs="Mumbai";
  String password="1234+";



  TextEditingController etUsername = new TextEditingController(text: "Nadir") ;
  TextEditingController emailid = new TextEditingController(text: "xyz@gmail.com") ;
  TextEditingController number = new TextEditingController(text: "123456789") ;
  TextEditingController organization = new TextEditingController(text: "Haresh Patel") ;
  TextEditingController address= new TextEditingController(text: "Mumbai") ;
  TextEditingController pass= new TextEditingController(text: "1234") ;
  TextEditingController pass2= new TextEditingController(text: "1234") ;
  @override
  Widget build(BuildContext context){
    File galleryFile;
    File cameraFile;
   //File ogFile=new File('images/activity.png');



    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + cameraFile.path);
      setState(() {});
    }

    Widget displaySelectedFile(File file){
      return Image.file(file);
    }
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
          title: Text("Settings"),
          centerTitle: true,
          actions:<Widget>[IconButton(icon: Icon(Icons.settings)) ,]

         /* actions:  <Widget>[
            new IconButton(
                icon:Icon(Icons.search) ,
                onPressed: () {}
            ),*/




      ),




      body: new ListView(
          children: <Widget>[


               Container(

                height: 100.0,
                alignment: Alignment.center,
                child: Container(child:
                Row(children:<Widget>[ Padding(padding: EdgeInsets.all(5),), CircularProfileAvatar(
                  '',
                 // child: Image.file(ogFile ),
                 // borderColor: Colors.purpleAccent,
                  backgroundColor: Colors.blueGrey,
                  initialsText: Text(
                    "HP",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                 // borderWidth: 5,
                 // elevation: 2,
                  radius: 40,
                ),Padding(padding: EdgeInsets.all(10),),Text("$username",style: TextStyle(fontSize:20 ),),
                  Padding(padding: EdgeInsets.all(35),),

                 IconButton(icon: Icon(Icons.border_color,color: Colors.black26,),
                    onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );

                    },
                  )],
                 ),),
                  ),


             const Divider(
              color: Colors.blue,
              height: 10,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),
            Padding(padding: EdgeInsets.all(8),),
            Container(child:Text('System Setings',style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.center,),
            Padding(padding: EdgeInsets.all(8),),
            Column(
            children :  <Widget>[
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10),),Icon(Icons.music_note),Text("Sound"),Padding(padding: EdgeInsets.all(10), ), DropSound()  ],),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.alarm),Text("Tone"),Padding(padding: EdgeInsets.all(15), ), DropTone()  ],),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Container(

                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.lightbulb_outline),Text("Theme"),Padding(padding: EdgeInsets.all(10), ), DropTheme()  ],),
              ),
              Padding(padding: EdgeInsets.all(20),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.verified_user),Text("Password"),Padding(padding: EdgeInsets.all(10), ),Text('$password') ,IconButton(icon: Icon(Icons.border_color,color: Colors.black26),onPressed: ()async {
                  await animated_dialog_box.showCustomAlertBox(
                      context: context,
                      firstButton: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Colors.white,
                        child: Text('Ok'),
                        onPressed: () {
                          setState(() {

                            password=pass.text;

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      yourWidget: Column(
                        children: <Widget>[
                           TextFormField(
                            controller: pass,
                            decoration: InputDecoration(

                                labelText: 'Enter new password',
                                hintText: "enter a 6 digit ",),
                              validator: (pass){
                                Pattern pattern =
                                    r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(pass))
                                  return 'Invalid password';
                                else
                                  return null;
                              },
                              //onSaved: (password)=> _password = password,
                            ),

                          TextFormField(
                            controller: pass2,
                            decoration: InputDecoration(

                                labelText: 'confirm your password',
                                hintText: "both the passwords should be same "
                            ),),
                        ]
                      )
                  );
                },

                )  ],),
              ),

             /* Padding(padding: EdgeInsets.all(10),),
              Container(child:Text('Edit Profile',style:TextStyle(fontWeight:FontWeight.bold),),alignment: Alignment.center,),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.mail),Text("Email Id"),Padding(padding: EdgeInsets.all(10), ),Text('$email') ,IconButton(icon: Icon(Icons.border_color,color: Colors.black26),onPressed: ()async {
                  await animated_dialog_box.showCustomAlertBox(
                      context: context,
                      firstButton: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Colors.white,
                        child: Text('Ok'),
                        onPressed: () {
                          setState(() {

                            email=emailid.text;

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      yourWidget: Container(
                        child: TextFormField(
                          controller: emailid,
                          decoration: InputDecoration(

                              labelText: 'Enter your email',
                              hintText: "enter a valid email id "
                          ),),
                      )
                  );
                },

                )  ],),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.phone),Text("Number"),Padding(padding: EdgeInsets.all(10), ),Text('$numb') ,IconButton(icon: Icon(Icons.border_color,color: Colors.black26),onPressed: ()async {
                  await animated_dialog_box.showCustomAlertBox(
                      context: context,
                      firstButton: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Colors.white,
                        child: Text('Ok'),
                        onPressed: () {
                          setState(() {
                            numb=number.text;

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      yourWidget: Container(
                        child: TextFormField(
                          controller: number,
                          decoration: InputDecoration(

                              labelText: 'Enter your number',
                              hintText: "enter 10 digit number "
                          ),),
                      )
                  );
                },

                )  ],),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.home),Text("Organization"),Padding(padding: EdgeInsets.all(10), ),Text('$organ') ,IconButton(icon: Icon(Icons.border_color,color: Colors.black26),onPressed: ()async {
                  await animated_dialog_box.showCustomAlertBox(
                      context: context,
                      firstButton: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Colors.white,
                        child: Text('Ok'),
                        onPressed: () {
                          setState(() {
                            organ=organization.text;

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      yourWidget: Container(
                        child: TextFormField(
                          controller: organization,
                          decoration: InputDecoration(

                              labelText: 'Enter orgaization name',
                              hintText: "name of your organization "
                          ),),
                      )
                  );
                },

                )  ],),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: Row(children:<Widget>[Padding(padding: EdgeInsets.all(10), ),Icon(Icons.location_on),Text("Address"),Padding(padding: EdgeInsets.all(10), ),Text('$addrs') ,IconButton(icon: Icon(Icons.border_color,color: Colors.black26),onPressed: ()async {
                  await animated_dialog_box.showCustomAlertBox(
                      context: context,
                      firstButton: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Colors.white,
                        child: Text('Ok'),
                        onPressed: () {
                          setState(() {
                            addrs=address.text;

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      yourWidget: Container(
                        child: TextFormField(
                          controller: address,
                          decoration: InputDecoration(

                              labelText: 'Enter Address',
                              hintText: "name of your Address "
                          ),),
                      )
                  );
                },

                )  ],),
              ),*/
            ]
            )



          ]

      ,


    )
    );
  }
}




