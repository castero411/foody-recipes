
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobydoby/Pages/common/subPages/Services/model.dart';


class RemoteServices2 {

  final String ItemNumber;
  RemoteServices2({required this.ItemNumber});

  Future<Meals?> getCategories() async {
    var client = http.Client();
    var uri = Uri.parse("www.themealdb.com/api/json/v1/1/lookup.php?i=52772");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      final Map<String, dynamic> data = jsonDecode(json);

      Meals meals = Meals.fromJson(data); // Adjusted to use Meals.fromJson

      return meals;
    } else {
      return null;
    }
  }
}
