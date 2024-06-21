import 'package:flutter/material.dart';


import 'package:pattom_cafe/bottomnavigation/bottomnavigation.dart';
import 'package:pattom_cafe/cart/provider/cartprovider.dart';
import 'package:pattom_cafe/cart/widget/cartfile.dart';
import 'package:pattom_cafe/categories/provider/categoriesprovider.dart';
import 'package:pattom_cafe/categories/widget/categoriesfile.dart';
import 'package:pattom_cafe/dropdownapi/dropdownapi.dart';
import 'package:pattom_cafe/dropdownapi/dropdownapi1.dart';

import'package:google_fonts/google_fonts.dart';
import 'package:pattom_cafe/homepage.dart';
import 'package:pattom_cafe/categories/categories.dart';

import 'package:pattom_cafe/onboarding/onboarding.dart';

import 'package:pattom_cafe/register.dart';
import 'package:pattom_cafe/shop/provider/shopprovider.dart';
import 'package:pattom_cafe/shop/widgets/cart.dart';
import 'package:pattom_cafe/shop/widgets/detailscree.dart';
import 'package:pattom_cafe/shop/widgets/emptyscreen.dart';
import 'package:pattom_cafe/shop/widgets/profile.dart';
import 'package:pattom_cafe/shop/widgets/shopfile..dart';
import 'package:pattom_cafe/signup.dart';
import 'package:pattom_cafe/splashscreen/splash.dart';
import 'package:provider/provider.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider
    (providers: [ChangeNotifierProvider(create: (context)=>Categoryprovider()),
    ChangeNotifierProvider(create: (context) => shopprovider()),
    ChangeNotifierProvider(create: (context) =>Cartprovider()
    )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
     
         
         textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
        ),
        home:SplashScreen(),
        routes: {
         'all_products_screen':(context) =>ProductsScreen(),
         'all_category_screen':(context) =>CategoryScreen(),
         'all_cart_screen':(context) => CartScreen(),
          'detailscreen': (context) {
           String id = ModalRoute.of(context)!.settings.arguments.toString();
           return detailscreen(id: 'product_id',
           
           );
           
         }
        }
      ),
    );
  }
}
class pattom_cafe extends StatefulWidget {
  const pattom_cafe({super.key});

  @override
  State<pattom_cafe> createState() => _pattom_cafeState();
}

class _pattom_cafeState extends State<pattom_cafe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
