import 'dart:convert';
import'package:http/http.dart' as http;
import'package:flutter/material.dart';
import 'package:pattom_cafe/bottomnavigation/bottomnavigation.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/register.dart';
import 'package:pattom_cafe/shop/widgets/shopfile..dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
   final _formKey = GlobalKey<FormState>();
  Future<void>registerHomemadeCraft(

String email,String password) async {
  const url ="http://campus.sicsglobal.co.in/Project/homemade_crafts/API/login.php";

  Map<String, String> body = {
  
    'email': email,
    
    'password': password,
  
  };

 try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
       var jsonData=json.decode(response.body);

      if (response.statusCode == 200) {
      if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(

         SnackBar(
          backgroundColor:Colors.black,
          content: const Text('Login Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=> bottom()));
      print(body);
      print("Response body${response.body}");
    
      print('Registration successful');
      }
      else{
        jsonData['status']==false;
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor:Colors.black ,
          content: const Text('Invalid username and password !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
         print('Error: ${response.statusCode}');
      }
     
    } else {
       
     print('fffff');
    }

  } catch (error) {
    print('Error: $error');
  }
}
  @override
  Widget build(BuildContext context) {
     Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height:double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/register.png'),fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
          child: Form(
             key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: size.height*0.40),
                  Text("WELCOME!",style: TextStyle(fontSize:35,fontWeight: FontWeight.bold,color: Colors.black ),),
                  Text("Time to purchase.Let's sign in",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),),
                 
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                     controller: emailcontroller,
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20),),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                  ),
                   validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter your email';
                }else{
                  return null;
                }
              },
                  ),
                  SizedBox(height:size.height*0.015,),
                  
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                     controller:passwordcontroller ,
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderSide:BorderSide.none,
                    borderRadius:BorderRadius.circular(20) ),
                  hintText: "Password",
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                hintStyle: TextStyle(color: Colors.black)
                  ),
                   validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter your password';
                }else{
                  return null;
                }
              },
                  ),
                  SizedBox(height:size.height*0.02,),
                  Center(child: TextButton(onPressed: (){}, child: Text("Forgot password?",style: TextStyle(color: orange),))),
                  Center(
                    child: SizedBox(
                      height: size.height*0.09,
                      width:size.height*0.6 ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor:orange,),
                        onPressed: (){
                           if (_formKey.currentState!.validate()) {
                              registerHomemadeCraft(
                               
                                emailcontroller.text.toString(),
                              
                                passwordcontroller.text.toString()
                      
                                
                              );
                            }
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>bottom()));
                        }, child: Text("Sign In",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("it's your first time here?",style: TextStyle(color: Colors.black),),
                      TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> login()));
                      }, child: Text("Sign up",style: TextStyle(color:orange),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}