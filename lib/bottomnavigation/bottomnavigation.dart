import'package:flutter/material.dart';
import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:pattom_cafe/cart/widget/cartfile.dart';
import 'package:pattom_cafe/categories/categories.dart';
import 'package:pattom_cafe/categories/widget/categoriesfile.dart';

import 'package:pattom_cafe/color/color.dart';
import 'package:pattom_cafe/homepage.dart';
import 'package:pattom_cafe/shop/widgets/cart.dart';
import 'package:pattom_cafe/shop/widgets/profile.dart';
import 'package:pattom_cafe/shop/widgets/shopfile..dart';
class bottom extends StatefulWidget {
   static final title = 'floating_salomon_bottom_bar';
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
   var _currentIndex = 0;
    final List<Widget>_children=[ProductsScreen(),CategoryScreen(),CartScreen(),profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: AdvancedSalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            AdvancedSalomonBottomBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("Home"),
              selectedColor:orange,
            ),

            /// Likes
            AdvancedSalomonBottomBarItem(
              icon: Icon(Icons.category_outlined),
              title: Text("Category"),
              selectedColor: orange,
            ),

            /// Search
            AdvancedSalomonBottomBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text("Category"),
              selectedColor: orange,
            ),

            /// Profile
            AdvancedSalomonBottomBarItem(
              icon: Icon(Icons.person_2_outlined),
              title: Text("Profile"),
              selectedColor:orange,
            ),
          ],
        ),
    );
      
    
  }
}


