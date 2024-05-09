import 'package:bloc/bloc.dart';
import 'package:calculator_app/feature/data/index.dart';
import 'package:calculator_app/feature/presentation/bloc/index.dart';
import 'dart:math' as math;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(0, DataModel.pure())) {
    on<SaveJsonDataEvent>(
      (event, emit) => emit(
        state.getStateCopy(
          response: DataResponse.fromJson(event.json),
        ),
      ),
    );

    on<RateOfInterestChangeEvent>(
      (event, emit) => emit(
        state.getStateCopy(
          dataModel: state.dataModel
              .copyFrom(selectedRateOfInterest: event.rateOfInterest,
              selectedCompound: 0),
        ),
      ),
    );

    on<PrincipalAmountChangeEvent>(
      (event, emit) => emit(
        state.getStateCopy(
          dataModel: state.dataModel.copyFrom(
              selectedPrincipalAmount: double.parse(event.principalAmount)),
        ),
      ),
    );

    on<CompoundChangedEvent>(
      (event, emit) => emit(
        state.getStateCopy(
          dataModel: state.dataModel.copyFrom(selectedCompound: event.compound),
        ),
      ),
    );

    on<NoOfYearsChangedEvent>(
      (event, emit) => emit(
        state.getStateCopy(
          dataModel:
              state.dataModel.copyFrom(selectedNumberOfYears: event.noOfYears),
        ),
      ),
    );

    on<CalculateInterest>((event, emit) {
      double rate = double.parse(state.dataModel.selectedRateOfInterest) / 100;
      double compoundBase = 1 + rate / state.dataModel.selectedCompound;
      double exponent = (state.dataModel.selectedCompound *
              state.dataModel.selectedNumberOfYears)
          .toDouble();
      double interest = state.dataModel.selectedPrincipalAmount *
          math.pow(compoundBase, exponent);
      emit(state.getStateCopy(
          dataModel: state.dataModel.copyFrom(interest: interest),calculatePressed: true));
    });
  }
}
