import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdView extends StatefulWidget {
  GoogleAdView({required this.adSize, required this.adUnitId});
  AdSize adSize;
  String adUnitId;
  @override
  _GoogleAdState createState() => _GoogleAdState();
}

class _GoogleAdState extends State<GoogleAdView> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
        // Change Banner Size According to Ur Need
        size: widget.adSize,
        adUnitId: widget.adUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, LoadAdError error) {
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: AdRequest())
      ..load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _isBannerAdReady
          ? const EdgeInsets.all(8.0)
          : const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isBannerAdReady)
                SizedBox(
                  height: _bannerAd.size.height.toDouble(),
                  width: _bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              if (_isBannerAdReady == false)
                SizedBox(
                  height: _bannerAd.size.height.toDouble(),
                  width: _bannerAd.size.width.toDouble(),
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text('Please Chek Your Internet Connection'),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
