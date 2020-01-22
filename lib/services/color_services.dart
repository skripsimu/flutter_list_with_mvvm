import 'dart:convert';

import 'package:flutter_list_with_mvvm/model/color_model.dart';
import 'package:http/http.dart' as http;

Future<List<ColorModel>> getColor() async {
  String url = "https://reqres.in/api/unknown";
  var response = await http.get(url);
  var jsonObject = jsonDecode(response.body);
  var colorData = (jsonObject as Map<String, dynamic>)['data'];
  print(colorData);
  return colorData
      .map<ColorModel>((json) => ColorModel.setColor(json))
      .toList();
}
