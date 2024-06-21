import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pattom_cafe/shop/models/shopmodels.dart';





class shopprovider with ChangeNotifier {
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

  List<ProductDetails> _products = [];//this is model class name
  List<ProductDetails> get products  {
    return [..._products];
  }

  Future getAllproductData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await http.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/View_product.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/View_product.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> productdetails = extractedData['productDetails'];//the value filmdetails is the variable from the api which stores the data (look in postman)
        for (var i = 0; i < productdetails.length; i++) {
          _products.add(
            ProductDetails(
            productId:productdetails[i]['product_id'].toString() ,
               productName: productdetails[i]['product_name'].toString(),
              quantity: productdetails[i]['quantity'].toString(),
              description: productdetails[i]['description'].toString(),
               additionalInformation : productdetails[i]['additional_Information '].toString(),
              price:productdetails[i]['price'].toString(),
              category: productdetails[i]['category'] .toString(),
               farmer: productdetails[i]['farmer'].toString(),
               categoryId : productdetails[i][' categoryId '].toString(),
              image: productdetails[i]['image'].toString(),
             
            ),

          );
        }
        ;

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