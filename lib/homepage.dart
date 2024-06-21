// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:pattom_cafe/itemwidget.dart';
// import 'package:pattom_cafe/register.dart';
// import'package:pattom_cafe/bottom.dart';
// import 'package:pattom_cafe/signup.dart';

// class homepage extends StatefulWidget {

//   const homepage({super.key});

//   @override
//   State<homepage> createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {

// List<String>catogories=["assets/fruits.png","assets/veggies.png","assets/diary.png","assets/bread.png","assets/herbs.png","assets/cereals.png",
// "assets/snacks.png","assets/oil.png","assets/beans.png","assets/condiments.png","assets/drinks.png","assets/baby.png","assets/meat.png",
// "assets/nuts.png","assets/shampoo.png"
// ];
// List<String>text=["Fruits","vegetables","Diary product","Bread","Herbs","Cereals","Snacks","Oil","Beans","Condiments","Drinks","Baby care",
// "Meat","Nuts","Shampoo"];
//   List<String>images=["assets/banana fry.jpg","assets/burger.jpg","assets/chai.jpg",
//   "assets/coffee new.jpg","assets/cutlet.jpg",
//  "assets/icecreams.jpg","assets/momos.jpg","assets/puffs.jpg","assets/sandwitch.jpg","assets/shakes.jpg"];
//  List<String>names=["Banana fry","Burger","Chai","Coffee","Cutlet","Icecream","Momos","Puffs","Sandwitch","Shakes"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      backgroundColor: Colors.black, 
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.black,
//         title: Center(child: Text("Menu",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
         
        
//       ),

//      drawer: SizedBox(
//       height: 600,width: 200,
//        child: Drawer(
//           backgroundColor: Colors.white,

//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                   decoration: BoxDecoration(color:Colors.brown),
//                   currentAccountPicture: const CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage('assets/profile.png'),
//                   ),
//                   accountName: const Text(
//                     'Vishal',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   accountEmail: const Text(
//                     'mailto:vishal123@gmail.com',
//                     style: TextStyle(fontWeight: FontWeight.w400),
//                   )),
//               ListTile(
//                 leading:  Icon(Icons.home,color:Colors.black,),
//                 title: const Text('Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
//                 onTap: () {
                
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => const PetViewScreen()));
//                 },
//               ),
              
             
           
//                ListTile(
//                 leading: Icon(Icons.message,color:Colors.black,),
//                 title: Text('Feedback',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
//               ),
//               ListTile(
//                 leading:  Icon(Icons.person,color:Colors.black,),
//                 title: const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
//                 onTap: () {
              
//                 },
//               ),
//               ListTile(
//                 leading:  Icon(Icons.logout,color: Colors.black,),
//                 title: const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text(
//                           'Logout',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         content:
//                             const Text('Are you sure want to exit this app?'),
//                         actions: <Widget>[
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>login()));
//                             },
//                             child: Text(
//                               'OK',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           ElevatedButton(
//                                   style: ElevatedButton.styleFrom(backgroundColor:Colors.black),
//                             onPressed: () {
//                               // Close the dialog
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               'CANCEL',
//                               style: TextStyle(
//                                  fontSize: 14,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           )
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//      ),
  
//       body:Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//         child:Column(
//           children: [
//             SizedBox(
              
//               child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
//               ),
//                          hintText: 'Search',
//                          fillColor: Colors.white,
//                          filled: true,
//                          prefixIcon: Icon(Icons.search,color: Colors.black),
                    
//               ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Categories",style: TextStyle(color: Colors.white),),
//                 Text("See all",style:TextStyle(color: Colors.white),),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: catogories.length,
//               scrollDirection: Axis.horizontal,
//                 itemBuilder:((context, index) {
//                 return
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 5),
//                    child: Column(
//                      children: [
//                        Container(
//                        height: 70,
//                                        width: 100,
//                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)
//                                        ,color:Colors.grey[200]),
//                                       child: Image.asset(catogories[index])
//                                        ),
//                                        SizedBox(height: 0.5,),
//                                        Text(text[index],style: TextStyle(color: Colors.white),)
//                      ],
//                    ),
                                   
//                  );
                
//               })
              
//                ),
//             ),
// SizedBox(height: 5,),
//             ImageSlideshow(
//           indicatorColor: Colors.blue,
//           onPageChanged: (value) {
//             debugPrint('Page changed: $value');
//           },
//           autoPlayInterval: 3000,
//           isLoop: true,
//           children: [
//             Image.asset(
//               'assets/offer pics.jpg',
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               'assets/icecream offers.jpg',
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               'assets/snacks offers.jpg',
//               fit: BoxFit.cover,
//             ),
//           ],
//         ),
            
//             SizedBox(height: 20,),
//             Expanded(
//               child: ItemWidget(),
//             ),
            
//           ],
//         )
//       ),
      
//     );
//   }
// }
