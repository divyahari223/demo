import 'package:flutter/material.dart';
class CartWidget extends StatefulWidget{
 final String cartId;
 final String productId;
 final String image;
 final String productName;
 final String price;
 final String quantity;
 final int itemTotal;
  CartWidget(
      {required this.cartId,
     required this.productId,
     required this.image,
     required this.productName,
     required this.price,
     required this.quantity,
     required this.itemTotal});

  @override
  State<CartWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CartWidget> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
  Size size =MediaQuery.of(context).size; 
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                 child: Center(child:Image.network(widget.image)),
               ),
             ),
             SizedBox(height: size.height*0.01,),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
          Text(widget.productName),
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
             Text(widget.price),
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
  }
}