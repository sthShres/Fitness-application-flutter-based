import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/screens/home/page/home_page.dart';
import 'package:flutter_firebase/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter_firebase/screens/onboarding/widget/onboarding_content.dart';
import 'package:flutter_firebase/screens/sign_in/page/sign_in_page.dart';
import 'package:flutter_firebase/screens/sign_up/page/sign_up_page.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (_, currState) => currState is NextScreenState,
        listener: (context, state) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) {
                return SignInPage();
              },
            ),
          );
        },
        buildWhen: (_, currState) => currState is OnboardingInitial,
        builder: (context, state) {
          return OnboardingContent();
        },
      ),
    );
  }
}
