import 'dart:convert';

Meals mealsFromJson(String str) => Meals.fromJson(json.decode(str));

class Meals {
  Map<String, dynamic> meals;

  Meals({
    required this.meals,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
    meals:json["meals"][0]
  );

}