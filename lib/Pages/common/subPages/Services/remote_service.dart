
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobydoby/Pages/common/subPages/Services/model.dart';


class RemoteServices2 {

  final String ItemNumber;
  bool random;
  RemoteServices2({required this.ItemNumber,this.random = false});

  Future<Meals?> getCategories() async {
    var client = http.Client();
    var uri;
    if (random) {
      uri = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + ItemNumber);
    }
    else{
      uri = Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php');
    }

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);

      Meals meals = Meals.fromJson(data); // Adjusted to use Meals.fromJson


      return meals;
    }
    else {
      return null;
    }
  }
}

