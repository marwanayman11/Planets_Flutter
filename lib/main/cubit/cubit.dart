import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/main/cubit/states.dart';
import 'package:planets/shared/remote/dio_helper.dart';

import '../../models/planet.dart';
import '../../shared/remote/endpoints.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);
  List<Planet> planets = [];

  void getPlanetsData() {
    emit(GetPlanetsLoadingState());
    DioHelper.getData(url: getPlanets).then((value) {
      value.data.forEach((planet) {
        planets.add(Planet.fromJson(planet));
      });
      emit(GetPlanetsSuccessState());
    }).catchError((error) {
      emit(GetPlantsErrorState(error.toString()));
    });
  }
}
