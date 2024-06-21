import 'package:flutter/material.dart';
class ncart extends StatefulWidget {
  const ncart({super.key});

  @override
  State<ncart> createState() => _ncartState();
}

class _ncartState extends State<ncart> {
  List<String> categories=["Apple","Orange","Apple","Orange","Apple","Orange",];
  List<String> images=["assets/fruits.png","assets/fruits.png","assets/fruits.png","assets/fruits.png","assets/fruits.png","assets/fruits.png",];
  List<String> price=["₹1500","₹1500","₹1500","₹1500","₹1500","₹1500"];
  int counter=1;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
     body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
       return SizedBox(
        height: size.height*0.2,
         child: Card(
         elevation: 2,
         shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
         child: Row(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: size.height*0.2,
                 width: size.width*0.3,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[200]),
                 child: Center(child: Image.asset(images[index],height: size.height*0.4,width: size.width*0.4,)),
               ),
             ),
             SizedBox(height: size.height*0.01,),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
          Text(categories[index]),
          SizedBox(height:size.height*0.01 ,),
           Card(
            color: Colors.grey[200],
               child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: Icon(Icons.add,)),
            Text(counter.toString()),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter--;
                });
              },
              child: Icon(Icons.remove))
          ],
               ),
             )
               ],
             ),
             SizedBox(width: size.width*0.05,),
             Text(price[index]),
             SizedBox(height: size.height*0.01,width: size.height*0.02,),
            Card(
              color: Colors.grey[200],
              child: IconButton(onPressed: (){
                
              }, icon: Icon(Icons.delete)),
            )
           ],
         ),
         ),
       );
     },),
    );
  }
}