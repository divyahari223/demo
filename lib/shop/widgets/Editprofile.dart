import 'package:flutter/material.dart';
import 'package:pattom_cafe/color/color.dart';
class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: Center(child: Text("Edit Profile",style: TextStyle(color: Colors.white),)),
        actions: [
          Icon(Icons.share,color: Colors.white,)
        ],
      ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height*0.25,
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
                    TextButton(onPressed: (){}, child: Text("Change Picture",style: TextStyle(color: Colors.white),))
                    ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Name"),
                       TextFormField(
                   controller: namecontroller, 
                   decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.person),
                   fillColor:Colors.grey[200],
                   filled: true,
                   ),
                  ),
                  SizedBox(height: size.height*0.01),
                   Text("Email"),
                  TextFormField(
                   controller: emailcontroller, 
                   decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.email),
                   fillColor:Colors.grey[200],
                   filled: true,
                   ),
                  ),
                  SizedBox(height:size.height*0.01),
                   Text("Phone Number"),
                  TextFormField(
                   controller: phonecontroller, 
                   decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.phone),
                   fillColor:Colors.grey[200],
                   filled: true,
                   ),
                  ),
                  SizedBox(height:size.height*0.01),
                   Text("Password"),
                  TextFormField(
                   controller: passwordcontroller, 
                   decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20),
                   ),
                   prefixIcon: Icon(Icons.lock),
                   fillColor:Colors.grey[200],
                   filled: true,
                   ),
                  ),
                  SizedBox(height:size.height*0.01),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:orange),
                      onPressed: (){}, child: Text("Update",style: TextStyle(color: Colors.white),)),
                  )
                    ],
                  ),
                ),
               
                ],),
          ),
              
    );
  }
}