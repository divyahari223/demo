import'package:flutter/material.dart';
import 'package:pattom_cafe/bottomnavigation/bottomnavigation.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/widgets/shopfile..dart';
class empty extends StatefulWidget {
  const empty({super.key});

  @override
  State<empty> createState() => _emptyState();
}

class _emptyState extends State<empty> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
     
      body: Column(
        children: [
          Container(
            height:size.height*0.55,
            width: double.infinity,
            child: Image.asset('assets/empty.png',fit: BoxFit.cover,),
          ),
          SizedBox(height: size.height*0.05,),
          Text("Cart is empty",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: size.height*0.01,),
          ElevatedButton(
           style: ElevatedButton.styleFrom(backgroundColor:orange), 
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>bottom()));
            }, child: Text("Continue shopping",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}