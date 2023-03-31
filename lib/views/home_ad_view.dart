import 'package:flutter/material.dart';
import 'package:google_ad_practicex/viewmodels/ad_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeAdView extends StatelessWidget {
  const HomeAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AdViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
