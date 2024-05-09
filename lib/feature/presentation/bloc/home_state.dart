import 'package:calculator_app/feature/data/index.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState(
    this.version,
    this.dataModel, {
    this.isLoading = false,
    this.calculatePressed = false,
    this.response,
    this.generalError = '',
  });
  final int version;
  final bool isLoading;
  final String generalError;
  final DataResponse? response;
  final DataModel dataModel;
  final bool calculatePressed;

  HomeState getStateCopy({
    bool? isLoading,
    DataModel? dataModel,
    String? generalError,
    bool? calculatePressed,
    DataResponse? response,
  }) =>
      HomeState(
        version + 1,
        dataModel ?? this.dataModel,
        response: response ?? this.response,
        calculatePressed: calculatePressed ?? false,
        isLoading: isLoading ?? false,
        generalError: generalError ?? '',
      );

  @override
  List<Object?> get props => [
        isLoading,
        generalError,
        response,
        dataModel,
        calculatePressed,
      ];

  int getRotMinAmount() {
    int minAmount;
    int rate = int.parse(dataModel.selectedRateOfInterest);

    if (rate >= 1 && rate <= 3) {
      minAmount = 10000;
    } else if (rate >= 4 && rate <= 7) {
      minAmount = 50000;
    } else if (rate >= 8 && rate <= 12) {
      minAmount = 75000;
    } else {
      minAmount = 100000;
    }
    return minAmount;
  }

  List<String> getCompoundItems() {
    List<String> items = [];

    response?.compoundData.values.entries.forEach((entry) {
      String key = entry.key;
      if (key == dataModel.selectedRateOfInterest) {
        items.add(entry.value.toString());
        return;
      }
    });

    if(items.isEmpty){
      items.addAll(["1","2","4"]);
    }

    return items;
  }
}
