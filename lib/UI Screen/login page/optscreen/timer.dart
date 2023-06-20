library timer_button;

import 'dart:async';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  elevatedButton,
  textButton,
  outlinedButton,
}

const int aSec = 1;

const String _secPostFix = 's';

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
    this.buttonType = ButtonType.elevatedButton,
    this.activeTextStyle,
    this.disabledTextStyle = const TextStyle(color: Colors.black45),
  }) : super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool timeUpFlag = false;
  int timeCounter = 0;

  String get _timerText => '0:$timeCounter${widget.secPostFix}';

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
    switch (widget.buttonType) {
      case ButtonType.elevatedButton:
        return Column(
          children: [
            Center(
              child: SmallText(
                text: _timerText,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            timeUpFlag
                ? TextButton(
                    onPressed: _onPressed,
                    child: RichText(
                      text: TextSpan(
                        text: 'Didn’t receive OTP?   ',
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: '  Resend Now',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
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
