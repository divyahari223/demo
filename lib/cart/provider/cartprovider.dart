import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pattom_cafe/cart/model/modelcart.dart';
class Cartprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }
  List<CartDetails> _products = [];//this is model class name
  List<CartDetails> get products  {
    return [..._products];
  }
  Future getAllCartData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await http.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=16"),
      );
      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=16");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> cartdetails = extractedData['cart_Details'];//the value is the variable from the api which stores the data (look in postman)
        for (var i = 0; i < cartdetails.length; i++) {
          _products.add(
           CartDetails (
            cartId:cartdetails[i]['cart_id'].toString(),
            productId:cartdetails[i]['product_id'].toString(),
            image:cartdetails[i]['image'].toString(),
            productName:cartdetails[i]['product_name'].toString(),
            price:cartdetails[i]['price'].toString(),
            quantity:cartdetails[i]['quantity'].toString(),
              itemTotal:cartdetails[i]['item_total'](),
            ),
          );
        };
        print('product details' + _products.toString());
        _isLoading = false;
        print('shop loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in shop prod -->>' + e.toString());
      print('shop Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}