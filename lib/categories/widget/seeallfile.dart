// import 'package:flutter/material.dart';
// import 'package:pattom_cafe/categories/provider/categoriesprovider.dart';
// import 'package:pattom_cafe/categories/widget/seeallwidget.dart';

// import 'package:pattom_cafe/color/color.dart';
// import 'package:pattom_cafe/shop/pages/loadingscreen.dart';
// import 'package:provider/provider.dart';


// class SeeAllCategoryScreen extends StatefulWidget { 
//    static const routeName = 'all_seeallcategory_screen';
//   const SeeAllCategoryScreen({super.key});

//   @override
//   State<SeeAllCategoryScreen> createState() => _SeeAllCategoryScreenState();
// }

// class _SeeAllCategoryScreenState extends State<SeeAllCategoryScreen> {




//     @override
//   void initState() {
    
//     Provider.of<Categoryprovider>(context, listen: false)
//         .getAllCategoryData(context: context);
  
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size=MediaQuery.of(context).size;
//     final seeallcategory=Provider.of<Categoryprovider>(context);
   
//     return Scaffold(
//         appBar: AppBar(
      
//         leading:  IconButton(onPressed: (){
//           Navigator.pop(context);
//         // ignore: prefer_const_constructors
//         },icon: Icon(Icons.arrow_back,color: Colors.white,)),
//         backgroundColor:orange,
//         title: const Text('Menu',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//         actions: [
//           Icon(Icons.add_shopping_cart_outlined,color: Colors.white,)
//         ],
//       ),
//     body:SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
          
            
//             seeallcategory.loadingSpinner
//                           ? const Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 LoadingScreen(title: 'Loading'),
//                                 CircularProgressIndicator(
//                                   color:Colors.green,
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
                             
//                               ],
//                             )
//                           : seeallcategory.products.isEmpty
//                               ? const Center(
//                                   child: Text(
//                                   'No Products..',
//                                   style: TextStyle(color:Colors.green),
//                                 ))
//                               : SizedBox(
//                                   height: size.height * 0.6,
//                                   child: ListView.builder(
//                     itemCount: seeallcategory.products.length,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {

//                       return  Seeallcategorywidget(
//                       id:seeallcategory.products[index].id,
//                      name:seeallcategory.products[index].name,
//                       quantity:seeallcategory.products[index].quantity,
//                       farmerId:seeallcategory.products[index].farmerId,
//                        image:seeallcategory.products[index].image,
                     
//                       );
//                     },
//                   )
//                                 ),
//           ],
//         ),
//       ),
//     ),  
//     );
//   }
// }