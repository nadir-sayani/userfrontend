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


void main(){
  runApp( new MaterialApp(home: EditProfile(),
    debugShowCheckedModeBanner: false,
  ));
}
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();}

class _EditProfileState extends State<EditProfile> {
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
            title: Text("Edit Profile"),
            centerTitle: true,
            actions:<Widget>[IconButton(icon: Icon(Icons.border_color)) ,]

          /* actions:  <Widget>[
            new IconButton(
                icon:Icon(Icons.search) ,
                onPressed: () {}
            ),*/




        ),




        body: new ListView(
          children: <Widget>[
        Padding(padding: EdgeInsets.all(10),),
        Container(alignment:Alignment.center,child: InkWell(child: CircularProfileAvatar(
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
    radius: 70,
    ),onTap: () async {
    await animated_dialog_box.showScaleAlertBox(
    title:Center(child: Text("Change Picture")) , // IF YOU WANT TO ADD
    context: context,
    firstButton: MaterialButton(
    // FIRST BUTTON IS REQUIRED
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    color: Colors.white,
    child: Text('Ok'),
    onPressed: () {
    /* setState(() {
                          ogFile=cameraFile;

                        });*/
    Navigator.of(context).pop();
    },
    ),
    secondButton: MaterialButton(
    // OPTIONAL BUTTON
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    color: Colors.white,
    child: Text('Cancel'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
    yourWidget:
    Container(
    child: Row(children: <Widget>[IconButton(icon: Icon(Icons.camera),onPressed:(){ imageSelectorCamera(); } ,),Padding(padding: EdgeInsets.all(10),),IconButton(icon: Icon(Icons.photo_album),onPressed: (){ imageSelectorGallery();},)],mainAxisAlignment:MainAxisAlignment.center,

    ),
    ));
    },),
        ),
            Padding(padding: EdgeInsets.all(10),),
            InkWell(child: Container(alignment:Alignment.center,child: Text("$username",style: TextStyle(),)),onTap : ()async {
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
                        username=etUsername.text;

                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  yourWidget: Container(
                    child: TextFormField(
                      controller: etUsername,
                      decoration: InputDecoration(

                          labelText: 'Enter your username',
                          hintText: "no special characters "
                      ),),
                  ));
            },),





            Padding(padding:EdgeInsets.all(15),),
            Container(alignment:Alignment.center,
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
            Container(alignment:Alignment.center,
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
            Container(alignment:Alignment.center,
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
            Container(alignment:Alignment.center,
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
            ),
            Padding(padding: EdgeInsets.all(40),),
            const Divider(
              color: Colors.black26,
              height: 2,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),





         ]   )






          ,


        );

  }
}




