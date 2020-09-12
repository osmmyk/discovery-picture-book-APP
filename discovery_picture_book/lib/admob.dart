import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_ad_manager/flutter_google_ad_manager.dart';

class AdMob {
  static final bool isTest = true; // テストモード
  static final bool isVisible = true; //広告を非表示モードに切り替える

  static final String iosBannerUnitId = 'ca-app-pub-8005321664615001~5594020189';  //iOS
  static final String androidBannerUnitId = 'ca-app-pub-8005321664615001~8195939278'; //Android

  static double smartBannerWidth = 0.0;
  static double smartBannerHeight = 0.0;
  static Widget bannerContainer;

  static DFPBannerViewController bannerViewController;

  static String getBannerUnitId() {
    if(Platform.isIOS) {
      return iosBannerUnitId;
    } else if(Platform.isAndroid) {
      return androidBannerUnitId;
    } else {
      return null;
    }
  }

  // このメソッドでバナー広告を取得する
  static Widget bannerAd(BuildContext context) {
    if(bannerContainer == null) {
      if(!isVisible) {
        bannerContainer = Container();
      } else {
        bannerContainer = buildBannerContainer(context);
      }
    }

    return bannerContainer;
  }

  static Widget buildBannerContainer(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      return DFPBanner(
        isDevelop: isTest,
        adUnitId: getBannerUnitId(),
        adSize: DFPAdSize.BANNER,
        onAdViewCreated: (controller) {
          bannerViewController = controller;
        },
        onAdOpened: () {
          print('Banner onAdOpened');
        },
        testDevices: MyTestDevices(),
      );
    } else {
      return Container();
    }
  }

}

//TODO 実機テストするデバイスを登録
class MyTestDevices extends TestDevices {

  static MyTestDevices _instance;

  factory MyTestDevices() {
    if (_instance == null) _instance = new MyTestDevices._internal();
    return _instance;
  }

  MyTestDevices._internal();

  @override
  List<String> get values => List()
    ..add('a32672edfc05960dc08eb453c8190a41'); //テストモードに切り替えたいデバイスのID
}