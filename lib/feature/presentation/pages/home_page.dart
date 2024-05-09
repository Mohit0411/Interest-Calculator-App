import 'package:calculator_app/feature/presentation/bloc/index.dart';
import 'package:calculator_app/feature/presentation/pages/index.dart';
import 'package:calculator_app/shared/utility/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: MediaQuery.sizeOf(context).width,
          leading: Material(
            color: ColorUtils.azul,
            child: Center(
              child: Text(
                'Interest Calculator App',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: ColorUtils.duckEggBlue,
        body: const SafeArea(
          bottom: false,
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
