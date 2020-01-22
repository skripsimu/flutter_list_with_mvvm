import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_with_mvvm/bloc/color_bloc.dart';
import 'package:flutter_list_with_mvvm/model/color_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    ColorModel list;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("MVVM LIST"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.brown,
        onPressed: () {
          colorBloc.add(1);
        },
        label: Text("Hit me to show list"),
      ),
      body: BlocBuilder<ColorBloc, List<ColorModel>>(
        builder: (context, color) => (color.length == 0)
            ? Center(
                child: Text("No list available!"),
              )
            : ListView.builder(
                itemCount: color.length,
                itemBuilder: (context, index) {
                  list = color[index];
                  String hexaCode = "0xFF" + list.color.substring(1);
                  int colorCode = int.parse(hexaCode);
                  return Container(
                    height: 100,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    color: Color(colorCode),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Name: ${list.name}"),
                        Text("Year: ${list.year}"),
                        Text("Build Number: ${list.pantoneValue}"),
                        Text("Color Code: ${list.color}"),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
