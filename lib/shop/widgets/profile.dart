import'package:flutter/material.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/widgets/Editprofile.dart';
import 'package:pattom_cafe/shop/widgets/support.dart';
import 'package:pattom_cafe/signup.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
       
        child: Column(
          children: [
            Container(
              height: size.height*0.4,
              width: double.infinity,
             decoration: BoxDecoration(color: orange,
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
            child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
            
            CircleAvatar(radius: 30,
            backgroundImage: AssetImage('assets/women.png'),
            ),
            Positioned(
              left: 40,
              bottom: 5,
              child: 
            
            CircleAvatar(
              radius: 10,
              child: Icon(Icons.camera_enhance_outlined,size: 10,),
            ),
            ),
                ],
                ),
                Text("Bosco William",style: TextStyle(color: Colors.white),),
                Text("+91 9072811165",style: TextStyle(color: Colors.white))
              ],
            ),
            ),
            SizedBox(height:size.height*0.02),
            Card(
             elevation: 2,
             child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text("Date of Birth",style: TextStyle(fontWeight: FontWeight.bold),),
                  
                
                     Text("Gender",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text("Phone",style: TextStyle(fontWeight: FontWeight.bold),),
                       ],
                 ),
                 
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Divya@gmail.com",style: TextStyle(fontWeight: FontWeight.bold),),
                         Text("05/01/1996",style: TextStyle(fontWeight: FontWeight.bold),),
                                      
                                        
                         Text("Male",style: TextStyle(fontWeight: FontWeight.bold),),
                         Text("+91 9072811165",style: TextStyle(fontWeight: FontWeight.bold),),
                       ],
                     ),
                 
               ],
             ), 
            ),
            SizedBox(height:size.height*0.01),
            SizedBox(
              height:size.height*0.07,
              child: Card(
                elevation: 2,
                child: Row(
                
                  children: [
                    SizedBox(width:size.width*0.2,),
                    Icon(Icons.lock,color: Colors.red,),
                    SizedBox(width:size.width*0.1),
                    Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
             SizedBox(height:size.height*0.01),
          
             SizedBox(height:size.height*0.01),
            SizedBox(
              height: size.height*0.07,
              child: Card(
                elevation: 2,
                child: Row(
                
                  children: [
                    SizedBox(width: size.width*0.2,),
                    Icon(Icons.safety_check,color: orange,),
                    SizedBox(width:size.width*0.1),
                    Text("Help",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(height:size.height*0.01),
             GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Editprofile()));
              },
               child: SizedBox(
                height: size.height*0.07,
                 child: Card(
                  elevation: 2,
                  child: Row(
                  
                    children: [
                      SizedBox(width: size.width*0.2),
                      Icon(Icons.person,color:Colors.blue,),
                      SizedBox(width:size.width*0.1,),
                      Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                             ),
               ),
             ),
               SizedBox(height:size.width*0.01),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>support()));
              },
              child: SizedBox(
                height: size.height*0.07,
                child: Card(
                  elevation: 2,
                  child: Row(
                  
                    children: [
                      SizedBox(width:size.width*0.2),
                      Icon(Icons.help_outline,color: orange,),
                      SizedBox(width:size.width*0.1),
                      Text("support",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
              SizedBox(height:size.height*0.01,),
            SizedBox(
              height: size.height*0.07,
              child: SizedBox(
                height: size.height*0.07,
                child: Card(
                  elevation: 2,
                  child: Row(
                  
                    children: [
                      SizedBox(width:size.width*0.2,),
                      Icon(Icons.logout,color:orange,),
                     SizedBox(width: size.width*0.1),
                      GestureDetector(
                        onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Logout',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content:
                                const Text('Are you sure want to exit this app?'),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>signup()));
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor:Colors.black),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'CANCEL',
                                  style: TextStyle(
                                     fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          );
                        },
                      );
                      },
                      
                       child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}