import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_create_page/cubit/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());

  void setName(String name) {
    emit(state.copyWith(name: name));
  }
}
