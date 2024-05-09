import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent({this.isLoading = false});
  final bool isLoading;

  List<Object?> includeProps();

  @override
  List<Object?> get props => [includeProps(), isLoading];
}

class SaveJsonDataEvent extends HomeEvent {
  const SaveJsonDataEvent({required this.json});
  final Map<String, dynamic> json;
  @override
  List<Object?> includeProps() => [json];
}

class RateOfInterestChangeEvent extends HomeEvent {
  const RateOfInterestChangeEvent({required this.rateOfInterest});
  final String rateOfInterest;
  @override
  List<Object?> includeProps() => [rateOfInterest];
}

class PrincipalAmountChangeEvent extends HomeEvent {
  const PrincipalAmountChangeEvent({required this.principalAmount});
  final String principalAmount;
  @override
  List<Object?> includeProps() => [principalAmount];
}

class CompoundChangedEvent extends HomeEvent {
  const CompoundChangedEvent({required this.compound});
  final int compound;
  @override
  List<Object?> includeProps() => [compound];
}

class NoOfYearsChangedEvent extends HomeEvent {
  const NoOfYearsChangedEvent({required this.noOfYears});
  final int noOfYears;
  @override
  List<Object?> includeProps() => [noOfYears];
}

class CalculateInterest extends HomeEvent {

  @override
  List<Object?> includeProps() => [];
}

