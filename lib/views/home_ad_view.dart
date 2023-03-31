import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ad_practicex/viewmodels/ad_viewmodel.dart';
import 'package:google_ad_practicex/views/widgets/ad_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class HomeAdView extends StatelessWidget {
  const HomeAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AdViewModel(),
      onViewModelReady: (viewModel) {
        late BannerAd myBanner;
        bool isAdLoaded = false;
        myBanner = BannerAd(
            adUnitId: Platform.isAndroid
                ? 'ca-app-pub-3940256099942544/6300978111'
                : 'ca-app-pub-3940256099942544/2934735716',
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                isAdLoaded = true;
                viewModel.rebuildUi();
              },
              onAdFailedToLoad: (ad, error) {},
            ),
            size: AdSize.banner,
            request: const AdRequest());
        myBanner.load();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Add Google Ads'),
          ),
          body: Column(
            children: [
              GoogleAdView(
                adSize: AdSize.banner,
                adUnitId: Platform.isAndroid
                    ? 'ca-app-pub-3940256099942544/6300978111'
                    : 'ca-app-pub-3940256099942544/2934735716',
              ),
              GoogleAdView(
                adSize: AdSize.banner,
                adUnitId: Platform.isAndroid
                    ? 'ca-app-pub-3940256099942544/6300978111'
                    : 'ca-app-pub-3940256099942544/2934735716',
              ),
              GoogleAdView(
                adSize: AdSize.banner,
                adUnitId: Platform.isAndroid
                    ? 'ca-app-pub-3940256099942544/6300978111'
                    : 'ca-app-pub-3940256099942544/2934735716',
              ),
              GoogleAdView(
                adSize: AdSize.banner,
                adUnitId: Platform.isAndroid
                    ? 'ca-app-pub-3940256099942544/6300978111'
                    : 'ca-app-pub-3940256099942544/2934735716',
              ),
              GoogleAdView(
                adSize: AdSize.banner,
                adUnitId: Platform.isAndroid
                    ? 'ca-app-pub-3940256099942544/6300978111'
                    : 'ca-app-pub-3940256099942544/2934735716',
              ),
            ],
          ),
        );
      },
    );
  }
}
