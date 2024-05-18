import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'model.dart';

class Service {
  final String categorie;

  Service({required this.categorie});

  Future<List<Meal>?> getItems() async {
    var client = http.Client();
    var uri = Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$categorie');

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        final Map<String, dynamic> data = jsonDecode(json);

        List<Meal> items = [];
        for (var element in data['meals']) {
          items.add(Meal.fromJson(element));
        }

        return items;
      } else {
        return null;
      }
    } catch (e) {
      // Handle exception
      log('Error: $e');
      return null;
    } finally {
      client.close();
    }
  }
}
