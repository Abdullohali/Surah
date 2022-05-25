import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_state.dart';

class TextCubit extends Cubit<double> {
  TextCubit() : super(0.0);

  double uzfontsize = 16.0;
  double arfontsize = 24.0;
  double transkripsiyasize = 24.0;

  void setUzfontsize(double size) {
    uzfontsize = size;
    emit(uzfontsize);
  }

  void setArfontsize(double size) {
    arfontsize = size;
    emit(arfontsize);
  }
  void setTranskripsiya(double size) {
    transkripsiyasize = size;
    emit(transkripsiyasize);
  }
}
