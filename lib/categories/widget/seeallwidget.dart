// import 'package:flutter/material.dart';
// import 'package:pattom_cafe/categories/widget/seeallfile.dart';

// class Seeallcategorywidget extends StatefulWidget {
//   final String id;
//   final String name;
//   final String quantity;
//   final  String farmerId;
//   final String image;

//   Seeallcategorywidget(
//       {required this.id, 
//       required this.name, 
//       required this.quantity, 
//       required this.farmerId, 
//       required this.image});

//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Seeallcategorywidget> {
//   @override
//   Widget build(BuildContext context) {
//   Size size =MediaQuery.of(context).size; 
//     return    Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//       child: Container(
//              height:size.height*0.06,
//              width: size.width*0.,
//               color: Colors.grey[300],
//               child:Row(
//                 children: [
//                  Image.network(widget.image,height: 20,width: 20),
//                   Text(widget.name),
              
              
//                 ],
//               ),
              
//             ),
//     );
//   }
// }