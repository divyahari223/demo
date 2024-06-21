import 'package:flutter/material.dart';
import 'package:pattom_cafe/cart/provider/cartprovider.dart';
import 'package:pattom_cafe/cart/widget/cartwidget.dart';
import 'package:pattom_cafe/categories/provider/categoriesprovider.dart';
import 'package:pattom_cafe/categories/widget/categorieswidget.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/pages/loadingscreen.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget { 
   static const routeName = 'all_cart_screen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {




    @override
  void initState() {
    
    Provider.of<Cartprovider>(context, listen: false)
        .getAllCartData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final cart=Provider.of<Cartprovider>(context);
   
    return Scaffold(
        appBar: AppBar(
      
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor:orange,
        title: const Text('Menu',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.add_shopping_cart_outlined,color: Colors.white,)
        ],
      ),
    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            cart.loadingSpinner
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoadingScreen(title: 'Loading'),
                                CircularProgressIndicator(
                                  color:Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                             
                              ],
                            )
                          : cart.products.isEmpty
                              ? const Center(
                                  child: Text(
                                  'No Products..',
                                  style: TextStyle(color:Colors.green),
                                ))
                              : SizedBox(
                                  height: size.height * 0.6,
                                  child: ListView.builder(
                    itemCount: cart.products.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (
                      context, index) {
                      return CartWidget(
                      cartId:cart.products[index].cartId,
                      productId:cart.products[index]. productId,
                     image:cart.products[index].image,
                     productName:cart.products[index].productName,
                       price:cart.products[index].price,
                        quantity:cart.products[index].quantity,
                        itemTotal:cart.products[index].itemTotal,
                     
                      );
                    },
                  )
                                ),
          ],
        ),
      ),
    ),  
    );
  }
}