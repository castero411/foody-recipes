
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobydoby/Pages/Page2/model/category.dart';

class RemoteServieces{

  Future<List<Category>?> getCategories() async{
    var client = http.Client();
    var uri = Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');

    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);

      List<Category> Categories = [];
      var element;
      for(element in data['categories']){
        Categories.add(Category.fromJson(element));
      }

      return Categories;
    }
    else{
      return null;
    }
  }

}