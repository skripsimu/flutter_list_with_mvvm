import 'package:flutter/cupertino.dart';

class ColorModel {
  String id;
  String name;
  String color;
  String year;
  String pantoneValue;
  ColorModel({
    this.id,
    this.name,
    this.color,
    this.year,
    this.pantoneValue,
  });
  factory ColorModel.setColor(Map<String, dynamic> json) => ColorModel(
      id: json['id'].toString(),
      name: json['name'],
      year: json['year'].toString(),
      color: json['color'],
      pantoneValue: json['pantone_value'].toString());
}
