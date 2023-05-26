abstract class MainStates {}

class InitialState extends MainStates {}

class GetPlanetsLoadingState extends MainStates {}

class GetPlanetsSuccessState extends MainStates {}

class GetPlantsErrorState extends MainStates {
  late final String error;

  GetPlantsErrorState(this.error);
}
