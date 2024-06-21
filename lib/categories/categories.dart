import'package:flutter/material.dart';
import 'package:pattom_cafe/bottomnavigation/bottomnavigation.dart';
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<String>catogories=["assets/fruits.png","assets/veggies.png","assets/diary.png",
  "assets/fruits.png","assets/veggies.png","assets/diary.png", "assets/fruits.png","assets/veggies.png","assets/diary.png"];
  List<String>text=["Fruits","vegetables","Diary product","Fruits","vegetables","Diary product","Fruits","vegetables","Diary product"];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>bottom()));
             }, icon: Icon(Icons.arrow_back)),
              Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          
              Icon(Icons.search)
            ],),
             Expanded(
               child: ListView.builder(
                  itemCount: catogories.length,
                scrollDirection: Axis.vertical,
                  itemBuilder:((context, index) {
                  return
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 5),
                     child: Column(
                       children: [
                         Container(
                         height: 50,
                                         width: double.infinity,
                                         decoration: BoxDecoration(
                                         color:Colors.grey[300]),
                                        child: Row(
                                          children: [
                                            Image.asset(catogories[index],height: 50,width: 50),
                                          
                                         
                                         SizedBox(width: 20,),
                                         Text(text[index],style: TextStyle(color: Colors.black),),
                                         ],
                                        ),),
                       ],
                     ),
                                     
                   );
                  
                })
                
                 ),
             ),
          ],
        ),
      ),
    );
  }
}
