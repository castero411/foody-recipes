import "package:mobydoby/Pages/common/Models/Categories.dart";
import "package:http/http.dart" as http;

class RemoteServices{
  Future<Categories?> get_categories() async{

    var client = http.Client();
    var uri = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    var response = await client.get(uri);

    if(response.statusCode == 200){
        var json = response.body;
        return categoriesFromJson(json);
    }
    return null;

  }

}