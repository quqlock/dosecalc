import 'package:dosimetric_calc/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constans.dart';
import '../bloc/splash_screen_bloc.dart';
import '../widgets/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}

BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
  return BlocProvider(
    create: (context) => SplashScreenBloc(),
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(kPrimaryColor),
      child: Center(
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            if ((state is SplashScreenInitial) ||
                (state is SplashScreenLoading)) {
              return SplashScreenWidget();
            } else if (state is SplashScreenLoaded) {
              return StartPage();
            }
          },
        ),
      ),
    ),
  );
}
