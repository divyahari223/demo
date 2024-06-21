import 'package:flutter/material.dart';
import 'package:pattom_cafe/categories/provider/categoriesprovider.dart';
import 'package:pattom_cafe/categories/widget/categorieswidget.dart';
import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/shop/pages/loadingscreen.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatefulWidget { 
   static const routeName = 'all_category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {




    @override
  void initState() {
    
    Provider.of<Categoryprovider>(context, listen: false)
        .getAllCategoryData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final category=Provider.of<Categoryprovider>(context);
   
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
          
            
            category.loadingSpinner
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
                          : category.products.isEmpty
                              ? const Center(
                                  child: Text(
                                  'No Products..',
                                  style: TextStyle(color:Colors.green),
                                ))
                              : SizedBox(
                                  height: size.height * 0.6,
                                  child: ListView.builder(
                    itemCount: category.products.length,
                    
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      return categorywidget(
                      id:category.products[index].id,
                     name:category.products[index].name,
                      quantity:category.products[index].quantity,
                      farmerId:category.products[index].farmerId,
                       image:category.products[index].image,
                     
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