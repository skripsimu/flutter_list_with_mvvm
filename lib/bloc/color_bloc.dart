import 'package:bloc/bloc.dart';
import 'package:flutter_list_with_mvvm/model/color_model.dart';
import 'package:flutter_list_with_mvvm/services/color_services.dart';

class ColorBloc extends Bloc<int, List<ColorModel>> {
  @override
  List<ColorModel> get initialState => [];

  @override
  Stream<List<ColorModel>> mapEventToState(int event) async* {
    try {
      List<ColorModel> colors = await getColor();
      yield colors;
    } catch (_) {}
  }
}
