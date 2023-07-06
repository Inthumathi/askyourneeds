import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog {
  static showLoaderDialog(BuildContext context, String popUpMsg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  SpinKitFadingCircle(
          color: sideMenuColor,
        );
      },
    );
  }
}
