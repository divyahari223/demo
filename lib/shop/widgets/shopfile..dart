import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pattom_cafe/categories/categories.dart';
import 'package:pattom_cafe/categories/provider/categoriesprovider.dart';
import 'package:pattom_cafe/categories/widget/categoriesfile.dart';
import 'package:pattom_cafe/categories/widget/categorieswidget.dart';
import 'package:pattom_cafe/categories/widget/seeallwidget.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/pages/loadingscreen.dart';
import 'package:pattom_cafe/shop/provider/shopprovider.dart';
import 'package:pattom_cafe/shop/widgets/shopwidgets.dart';
import 'package:provider/provider.dart';


class ProductsScreen extends StatefulWidget { 
   static const routeName = 'all_products_screen';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String>text=["Fruits","vegetables","Diary product",
];
List<String>catogories=["assets/fruits.png","assets/veggies.png","assets/diary.png"];
TextEditingController SearchController  =TextEditingController();



    @override
  void initState() {
    
    Provider.of<shopprovider>(context, listen: false)
        .getAllproductData(context: context);
  Provider.of<Categoryprovider>(context, listen: false)
        .getAllCategoryData(context: context);
    super.initState();
    
  
   
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final shop=Provider.of<shopprovider>(context);
    final category=Provider.of<Categoryprovider>(context);
   final seeallcategory=Provider.of<Categoryprovider>(context);
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
            ImageSlideshow(
              indicatorColor: Colors.blue,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                Image.asset(
                  'assets/offer1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/offer2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/offer3.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ), 
            SizedBox(height: 10,),
            TextFormField(
              controller: SearchController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none),
              hintText: "Search",
              fillColor: Colors.grey[200],
              filled: true,
              prefixIcon: Icon(Icons.search),
              iconColor: Colors.white
              ),
           
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
               TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen()));
               }, child: Text("See all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),))
       ]),
          //  seeallcategory.loadingSpinner
          //                 ? const Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       LoadingScreen(title: 'Loading'),
          //                       CircularProgressIndicator(
          //                         color:Colors.green,
          //                       ),
          //                       SizedBox(
          //                         width: 10,
          //                       ),
                             
          //                     ],
          //                   )
          //                 : seeallcategory.products.isEmpty
          //                     ? const Center(
          //                         child: Text(
          //                         'No Products..',
          //                         style: TextStyle(color:Colors.green),
          //                       ))
          //                     : SizedBox(
          //                         height: size.height * 0.6,
          //                         child: ListView.builder(
          //           itemCount: seeallcategory.products.length,
          //           scrollDirection: Axis.vertical,
          //           shrinkWrap: true,
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemBuilder: (context, index) {

          //             return  Seeallcategorywidget(
          //             id:seeallcategory.products[index].id,
          //            name:seeallcategory.products[index].name,
          //             quantity:seeallcategory.products[index].quantity,
          //             farmerId:seeallcategory.products[index].farmerId,
          //              image:seeallcategory.products[index].image,
                     
          //             );
          //           },
          //         )
          //                       ),
            shop.loadingSpinner
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
                          : shop.products.isEmpty
                              ? const Center(
                                  child: Text(
                                  'No Products..',
                                  style: TextStyle(color:Colors.green),
                                ))
                              : SizedBox(
                                 // height: size.height * 0.6,
                                  child: GridView.builder(
                    itemCount: shop.products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.98,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Shopwidget(
                      productId:shop.products[index].productId,
                      productName:shop.products[index].productName,
                      quantity:shop.products[index].quantity,
                      description:shop.products[index].description,
                      additionalInformation:shop.products[index].additionalInformation,
                      price:shop.products[index].price,
                      category:shop.products[index].category,
                      farmer:shop.products[index].farmer,
                      categoryId:shop.products[index].categoryId,
                      image:shop.products[index].image  ,
                      );
                    },
                  )
                                ),
        
          ],
      )  ,),
    ),
    );
  }
}