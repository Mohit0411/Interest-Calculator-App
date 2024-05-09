import 'dart:convert';

import 'package:calculator_app/feature/index.dart';
import 'package:calculator_app/feature/presentation/bloc/index.dart';
import 'package:calculator_app/feature/presentation/index.dart';
import 'package:calculator_app/shared/utility/color_utils.dart';
import 'package:calculator_app/shared/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loadJson();
    super.initState();
  }

  _loadJson() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/test_data.json');
    if (!mounted) return;
    context
        .read<HomeBloc>()
        .add(SaveJsonDataEvent(json: json.decode(jsonString)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (contex, state) {
        if (state.dataModel.interest != 0 && state.calculatePressed) {
          if (state.response?.outputData.modeOfDisplay == 'snackBar') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Column(
                  children: [
                    Text(
                      state.response?.outputData.labelText ?? '',
                      style: TextStyle(
                        color: state.response?.outputData.textColor.toColor(),
                        fontSize: state.response?.outputData.textSize,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.dataModel.interest.toString(),
                      style: TextStyle(
                        color: state.response?.outputData.textColor.toColor(),
                        fontSize: state.response?.outputData.textSize,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.response?.outputData.modeOfDisplay ==
              'popupDialog') {
            CustomDialog(
              hintText: state.response?.outputData.labelText ?? '',
              interest: state.dataModel.interest.toString(),
              style: TextStyle(
                color: state.response?.outputData.textColor.toColor(),
                fontSize: state.response?.outputData.textSize,
              ),
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        return state.response != null && !state.isLoading
            ? Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropDownField(
                      value: state.dataModel.selectedRateOfInterest.isNotEmpty
                          ? state.dataModel.selectedRateOfInterest.toString()
                          : null,
                      onChanged: (value) {
                        context.read<HomeBloc>().add(RateOfInterestChangeEvent(
                            rateOfInterest: value ?? ''));
                      },
                      labelText: state.response?.rateOfInterest.labelText ?? '',
                      items: state.response?.rateOfInterest.values.entries
                          .map<DropdownMenuItem<String>>((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.value),
                        );
                      }).toList(),
                      labelStyle: TextStyle(
                        color:
                            state.response?.rateOfInterest.textColor.toColor(),
                        fontSize: state.response?.rateOfInterest.textSize ?? 0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomEditText(
                      inputTextStyle: TextStyle(
                        color:
                            state.response?.principalAmount.textColor.toColor(),
                        fontSize: state.response?.principalAmount.textSize,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter principal amount';
                        } else if (int.parse(value) <=
                            state.getRotMinAmount()) {
                          return state.response?.principalAmount.minErrorMessage
                              .replaceAll("%minimumAmount%",
                                  state.getRotMinAmount().toString());
                        } else if (double.parse(value) >=
                            (state.response?.principalAmount.maximumAmount ??
                                0)) {
                          return state
                              .response?.principalAmount.maxErrorMessage;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      labelText: state.response?.principalAmount.hintText ?? '',
                      onChanged: (value) {
                        context.read<HomeBloc>().add(
                            PrincipalAmountChangeEvent(principalAmount: value));
                      },
                    ),
                    DropDownField<String>(
                      value: state.dataModel.selectedCompound != 0
                          ? state.dataModel.selectedCompound.toString()
                          : null,
                      onChanged: (value) {
                        context.read<HomeBloc>().add(CompoundChangedEvent(
                            compound: int.parse(value ?? '0')));
                      },
                      labelText: state.response?.compoundData.labelText ?? '',
                      items: state
                          .getCompoundItems()
                          .map<DropdownMenuItem<String>>((item) =>
                              DropdownMenuItem<String>(
                                  value: item, child: Text(item)))
                          .toList(),
                      labelStyle: TextStyle(
                        color: state.response?.compoundData.textColor.toColor(),
                        fontSize: state.response?.compoundData.textSize ?? 0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DropDownField(
                      value: state.dataModel.selectedNumberOfYears != 0
                          ? state.dataModel.selectedNumberOfYears.toString()
                          : null,
                      onChanged: (value) {
                        context.read<HomeBloc>().add(NoOfYearsChangedEvent(
                            noOfYears: int.parse(value ?? '0')));
                      },
                      labelText: state.response?.noOfYears.labelText ?? '',
                      items: state.response?.noOfYears.values.entries
                          .map<DropdownMenuItem<String>>((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.value),
                        );
                      }).toList(),
                      labelStyle: TextStyle(
                        color: state.response?.noOfYears.textColor.toColor(),
                        fontSize: state.response?.noOfYears.textSize ?? 0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRaisedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<HomeBloc>().add(CalculateInterest());
                        }
                      },
                      title: 'Calculate',
                      textColor: Colors.white,
                      backgroundColor: ColorUtils.azul,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    (state.dataModel.interest != 0)
                        ? state.response?.outputData.modeOfDisplay ==
                                'textField'
                            ? CustomEditText(
                                initialValue:
                                    state.dataModel.interest.toString(),
                                inputTextStyle: TextStyle(
                                  color: state.response?.outputData.textColor
                                      .toColor(),
                                  fontSize: state.response?.outputData.textSize,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter principal amount';
                                  }
                                  return null;
                                },
                                enabled: false,
                                labelText:
                                    state.response?.outputData.labelText ?? '',
                                onChanged: (value) {},
                              )
                            : const SizedBox.shrink()
                        : const SizedBox.shrink()
                  ],
                ),
              )
            : const CustomProgressIndicator();
      },
    );
  }
}
