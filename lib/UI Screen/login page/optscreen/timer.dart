library timer_button;

import 'dart:async';

import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  ElevatedButton,
  TextButton,
  OutlinedButton,
}

const int aSec = 1;

const String _secPostFix = 's';
const String labelSplitter = " |  ";

class TimerButton extends StatefulWidget {
  final String label;
  final String secPostFix;
  final int timeOutInSeconds;
  final VoidCallback onPressed;
  final Color color;
  final Color disabledColor;
  final TextStyle? activeTextStyle;
  final TextStyle disabledTextStyle;
  final ButtonType buttonType;
  final bool resetTimerOnPressed;
  final bool timeUpFlag;

  const TimerButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.timeOutInSeconds,
    this.secPostFix = _secPostFix,
    this.color = Colors.blue,
    this.resetTimerOnPressed = true,
    this.timeUpFlag = false,
    this.disabledColor = Colors.grey,
    this.buttonType = ButtonType.ElevatedButton,
    this.activeTextStyle,
    this.disabledTextStyle = const TextStyle(color: Colors.black45),
  }) : super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool timeUpFlag = false;
  int timeCounter = 0;

  String get _timerText => '$timeCounter${widget.secPostFix}';

  @override
  void initState() {
    super.initState();
    timeCounter = widget.timeOutInSeconds;
    timeUpFlag = widget.timeUpFlag;
    _timerUpdate();
  }

  _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  _timerUpdate() {
    if (timeUpFlag) {
      return;
    }
    // To avoid negative values
    if (timeCounter < 0) {
      timeCounter = -1 * timeCounter;
    }
    Timer(const Duration(seconds: aSec), () async {
      timeCounter--;
      _updateState();
      if (timeCounter != 0) {
        _timerUpdate();
      } else {
        timeUpFlag = true;
      }
    });
  }

  // Widget _buildChild() {
  //   TextStyle? activeTextStyle;
  //   if (widget.activeTextStyle == null) {
  //     if (widget.buttonType == ButtonType.OutlinedButton) {
  //       activeTextStyle = TextStyle(color: widget.color);
  //     } else {
  //       activeTextStyle = const TextStyle(color: Colors.white);
  //     }
  //   } else {
  //     activeTextStyle = widget.activeTextStyle;
  //   }
  //   return Container(
  //     child: timeUpFlag
  //         ? SmallText(
  //             text: 'Resend OTP?',
  //             color: blackColor,
  //             fontWeight: FontWeight.w500,
  //           )
  //         : Text(
  //             widget.label + labelSplitter + _timerText,
  //             style: TextStyle(color: Colors.blueGrey),
  //           ),
  //   );
  // }

  _onPressed() {
    if (timeUpFlag) {
      timeUpFlag = false;
      _updateState();
      timeCounter = widget.timeOutInSeconds;
      widget.onPressed();
      // reset the timer when the button is pressed
      if (widget.resetTimerOnPressed) {
        _timerUpdate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final color = timeUpFlag ? widget.color : widget.disabledColor;
    switch (widget.buttonType) {
      case ButtonType.ElevatedButton:
        return timeUpFlag
            ? InkWell(
                onTap: () {
                  _onPressed();
                },
                child: SmallText(
                  text: 'Resend OTP',
                  color: blackColor,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ))
            : Row(
                children: [
                  SmallText(
                    text: 'Resend OTP in',
                    color: primaryColor,
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  SmallText(
                    text:'$labelSplitter $_timerText',
                    color: primaryColor,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              );
      // case ButtonType.TextButton:
      //   return TextButton(
      //     onPressed: _onPressed,
      //     style: TextButton.styleFrom(
      //       backgroundColor: color,
      //     ),
      //     child: _buildChild(),
      //   );
      // case ButtonType.OutlinedButton:
      //   return OutlinedButton(
      //     onPressed: _onPressed,
      //     style: OutlinedButton.styleFrom(
      //       side: BorderSide(
      //         color: color,
      //       ),
      //     ),
      //     child: _buildChild(),
      //   );
      default:
        return Container();
    }
  }
}
