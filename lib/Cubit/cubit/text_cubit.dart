import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_state.dart';

class TextCubit extends Cubit<double> {
  TextCubit() : super(0.0);

  double Uzfontsize = 16.0;
  double Arfontsize = 24.0;

  void setUzfontsize(double size) {
    Uzfontsize = size;
    emit(Uzfontsize);
  }

  void setArfontsize(double size) {
    Arfontsize = size;
    emit(Arfontsize);
  }
}
