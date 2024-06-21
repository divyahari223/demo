import'package:flutter/material.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/provider/shopprovider.dart';
import 'package:pattom_cafe/shop/widgets/shopfile..dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

class detailscreen extends StatefulWidget {
    static const routeName = 'detail_screen';
    final String id;
  const detailscreen({super.key,
   required this.id,
  });

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {
    final Shop= Provider.of< shopprovider>(context).products.firstWhere((element) => element.productId == widget.id);
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
       }, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(Icons.shopping_cart)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              height: size.height*0.3,
              width: double.infinity,
             decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(Shop.image),fit: BoxFit.cover
                ),
            )
            ),
            Text(Shop.productName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("₹"+Shop.price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("Quantity:"+Shop.quantity,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[500]),),
            Text("Type:"+Shop.category,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            Text("Farmer:"+Shop.farmer,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            SizedBox(height: size.height*0.01,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(Shop.description,),
                SizedBox(height:size.height*0.01,),
               Container(
                height: size.height*0.065,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: orange),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineIcons.addToShoppingCart,color: Colors.white),
                    Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
               )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}