import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pattom_cafe/categories/model/categorymodel.dart';






class Categoryprovider with ChangeNotifier {
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

  List<CategoryDetails > _products = [];//this is model class name
  List<CategoryDetails > get products  {
    return [..._products];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await http.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_category.php?farmer_id=1"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_category.php?farmer_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> categorydetails = extractedData['categoryDetails'];//the value filmdetails is the variable from the api which stores the data (look in postman)
        for (var i = 0; i < categorydetails.length; i++) {
          _products.add(
           CategoryDetails (
            id: categorydetails [i]['id'].toString(),
            name: categorydetails [i]['name'].toString(),
            quantity: categorydetails [i]['quantity'].toString(),
            farmerId: categorydetails [i]['farmer_id'].toString(),
            image: categorydetails [i]['image'].toString(),
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