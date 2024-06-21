import 'package:flutter/material.dart';
import 'package:pattom_cafe/color/color.dart';
class support extends StatefulWidget {
  const support({super.key});

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
       child: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text("Let us know your queries and feedback",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
            SizedBox(height: size.height*0.01,),
            TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          borderSide:BorderSide(color: Colors.black)),
          hintText: "Email",
          suffixIcon: Icon(Icons.email),iconColor: orange,
          
          ),
          
        ),
              SizedBox(height: size.height*0.01,),
        TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          borderSide:BorderSide(color: Colors.black)),
          hintText: "Call Us",
          suffixIcon: Icon(Icons.phone),iconColor: orange,
          
          ),
          
        ),
            SizedBox(height: size.height*0.02),
            Text("Write Us",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Enter Your Message"),
            SizedBox(height: size.height*0.04,),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(borderSide:BorderSide(color: Colors.black),),
              hintText: "Write here"
              ),
            ),
            SizedBox(height: size.height*0.03,),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)))
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: orange,borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 250,
            width: double.infinity,
            child: Image(image: AssetImage('assets/customer.png',),),
          )
          ],
         ),
       ),
     ), 
    );
  }
}