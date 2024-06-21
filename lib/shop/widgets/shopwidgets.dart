import 'package:flutter/material.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/provider/shopprovider.dart';
import 'package:pattom_cafe/shop/widgets/detailscree.dart';
import 'package:provider/provider.dart';
class Shopwidget extends StatefulWidget {
 final String productId;
 final String productName;
 final String quantity;
 final String description;
 final String additionalInformation;
 final String price;
 final String category;
 final String farmer;
 final String categoryId;
 final String image;
  Shopwidget(
      { required this.productId,
     required this.productName,
     required this.quantity,
     required this.description,
     required this.additionalInformation,
     required this.price,
     required this.category,
     required this.farmer,
     required this.categoryId,
     required this.image,
     });

  @override
  State<Shopwidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Shopwidget> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
body: Column(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>detailscreen(id: widget.productId)));
      },
      child: Card(
        elevation: 5,
        color: Colors.white.withOpacity(0.9),
        child:Column(
          children: [
            Image.network(widget.image,height: 120,width: 200,),
            Text(widget.productName),
        
        Text("₹:"+widget.price)
          ],
        ),
        
      ),
    )
  ],
),

    );
  }
}