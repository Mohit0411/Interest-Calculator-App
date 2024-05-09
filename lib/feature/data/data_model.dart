import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final String selectedRateOfInterest;
  final double selectedPrincipalAmount;
  final int selectedCompound;
  final int selectedNumberOfYears;
  final double interest;

  const DataModel._(
    this.selectedRateOfInterest,
    this.selectedPrincipalAmount,
    this.selectedCompound,
    this.selectedNumberOfYears,
    this.interest,
  );

  const DataModel.pure() : this._('', 0, 0, 0, 0);

  DataModel copyFrom({
    String? selectedRateOfInterest,
    double? selectedPrincipalAmount,
    int? selectedCompound,
    int? selectedNumberOfYears,
    double? interest,
  }) {
    return DataModel._(
      selectedRateOfInterest ?? this.selectedRateOfInterest,
      selectedPrincipalAmount ?? this.selectedPrincipalAmount,
      selectedCompound ?? this.selectedCompound,
      selectedNumberOfYears ?? this.selectedNumberOfYears,
      interest ?? this.interest,
    );
  }

  @override
  List<Object?> get props => [
        selectedRateOfInterest,
        selectedPrincipalAmount,
        selectedCompound,
        selectedNumberOfYears,
        interest
      ];
}
