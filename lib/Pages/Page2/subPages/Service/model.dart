import 'dart:convert';

MealItem mealItemFromJson(String str) => MealItem.fromJson(json.decode(str));

String mealItemToJson(MealItem data) => json.encode(data.toJson());

class MealItem {
  List<Meal> meals;

  MealItem({
    required this.meals,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) => MealItem(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
