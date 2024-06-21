import 'package:flutter/material.dart';

class categorywidget extends StatefulWidget {
  final String id;
  final String name;
  final String quantity;
  final  String farmerId;
  final String image;

  categorywidget(
      {required this.id, 
      required this.name, 
      required this.quantity, 
      required this.farmerId, 
      required this.image});

  @override
  State<categorywidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<categorywidget> {
  @override
  Widget build(BuildContext context) {
  Size size =MediaQuery.of(context).size; 
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
             height:size.height*0.06,
             width: double.infinity,
              color: Colors.grey[300],
              child:Row(
                children: [
                 Image.network(widget.image,height: 40,width: 40),
                  Text(widget.name),
              
              
                ],
              ),
              
            ),
    );
  }
}