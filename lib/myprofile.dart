import 'package:flutter/material.dart';
import 'package:leadmanagement/assets/icons.dart';
import 'package:leadmanagement/main.dart';
//import 'package:leadmanagement/newlead.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import 'dart:io';
import 'package:flutter_multiselect/flutter_multiselect.dart';





void main() {
    runApp(myprofile());}

class myprofile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profile()
    );
  }
}
class profile extends StatelessWidget {


  void customLaunch(command) async{
    if(await canLaunch(command))  {
      await launch(command);
    }
    else{
      print("could not launch$command");
    }
  }

   launchWhatsApp(
      {@required String phone,
        @required String message,
      }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }




    @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
               elevation: 0.0,
               title: Text('My Profile',),
                leading: IconButton(icon:Icon(Icons.arrow_back),
                 onPressed:() =>  () {} ,
                  ),
          actions: [
            IconButton(icon:Icon(Icons.settings),
            onPressed:() =>  () {} ,
          ),


          ],
        ),
                 body: Container(
                   padding: EdgeInsets.only(left: 16,top: 25,right: 16),
                   child: GestureDetector(
                     onTap:(){
                       FocusScope.of(context).unfocus();
                     } ,

                   child: ListView(
                     children: [
                       SizedBox(
                         height: 16,
                       ),
                       Center(
                          child:  Stack(
                         children: [
                           Container(
                             width: 130,
                             height: 130,
                             decoration: BoxDecoration(
                               border: Border.all(
                                 width: 4,
                                 color: Colors.white
                               ),
                               shape: BoxShape.circle,
                               image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image:AssetImage( 'Images/person.png')
                               ),
                             ),
                           )

                         ],
                       )
                       ),
                       SizedBox(
                         height: 25,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Name',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '                      Haresh  Patel', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Phone Number',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '       xxxxxxxxxx', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Address ',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '                 Mumbai', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Email address',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '      xyz@gmail.com', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),

                       ),
                       SizedBox(
                         height: 10,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Designation ',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '          Bussiness', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       RichText(
                         text: TextSpan(
                           text: ' Organization',
                           style: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           children: <TextSpan>[
                             TextSpan(text: '         abc', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                           ],
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Divider(),
                       Spacer(
                         flex: 1,
                       ),
                       Row(

                             children: [
                               Container(
                                 width: 40,
                                 height: 40,
                                 child:
                                 InkWell(
                                   onTap: (){
                                     customLaunch('https://twitter.com');
                                   },
                                   child: Container(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20.0),
                                       child: Image.asset('Images/twitter.png'
                                           ),
                                     ),),
                                  ),
                               ),
                               Spacer(
                                 flex: 1,
                               ),
                               Container(
                                 width: 40,
                                 height: 40,
                                 child:
                                 InkWell(
                                   onTap: (){
                                     customLaunch('https://www.linkedin.com');
                                   },
                                   child: Container(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20.0),
                                       child: Image.asset('Images/linkedin.png'
                                       ),
                                     ),),
                                 ),
                               ),

                               Spacer(
                                 flex: 1,
                               ),
                               Container(
                                 width: 40,
                                 height: 40,
                                 child:
                                 InkWell(
                                   onTap: (){
                                    customLaunch('mailto:');
                                   },
                                   child: Container(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20.0),
                                       child: Image.asset('Images/gmail.png'
                                       ),
                                     ),),
                                 ),
                               ),

                               Spacer(
                                 flex: 1,
                               ),
                               Container(
                                 width: 40,
                                 height: 40,
                                 child:
                                 InkWell(
                                   onTap: (){
                                     launchWhatsApp(phone: '8805510099', message: 'hii');
                                     //customLaunch('https://wa.me/9309545109');
                                   },
                                   child: Container(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20.0),
                                       child: Image.asset('Images/whatsapp.png'
                                       ),
                                     ),),
                                 ),
                               ),
                               Spacer(
                                 flex: 1,
                               ),
                               Container(
                                 width: 40,
                                 height: 40,
                                 child:
                                 InkWell(
                                   onTap: (){
                                     customLaunch('https://www.google.com');
                                   },
                                   child: Container(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(20.0),
                                       child: Image.asset('Images/language.png'
                                       ),
                                     ),),
                                 ),
                               ),

                             ],
                       ),

                     ],

                   ),

    ),
    )
    );



  }
}
/////////////////////////////
/*TextField(
decoration: InputDecoration(
labelText: 'Name',
floatingLabelBehavior: FloatingLabelBehavior.always,
hintText: 'haresh patel',
hintStyle: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold ,
color: Colors.black

)
),
),*/