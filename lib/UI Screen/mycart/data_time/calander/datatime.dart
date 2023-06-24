
import 'package:askun_delivery_app/UI%20Screen/mycart/data_time/calander/catchecustombuilder.dart';
import 'package:flutter/material.dart';

import 'catchestream.dart';
import 'comparedata.dart';

class DateItem extends StatefulWidget {
  final DateTime today;
  final DateTime? date;
  final TextStyle? dateStyle;
  final TextStyle? pressedDateStyle;
  final Color? backgroundColor;
  final Color? todayBackgroundColor;
  final Color? pressedBackgroundColor;
  final Alignment? decorationAlignment;
  final BoxShape? dayShapeBorder;
  final void Function(DateTime)? onDatePressed;
  final void Function(DateTime)? onDateLongPressed;
  final Widget? decoration;
  final CacheStream<DateTime?> cacheStream;

  DateItem({
    required this.today,
    required this.date,
    required this.cacheStream,
    this.dateStyle,
    this.pressedDateStyle,
    this.backgroundColor = Colors.transparent,
    this.todayBackgroundColor = Colors.orangeAccent,
    this.pressedBackgroundColor,
    this.decorationAlignment = FractionalOffset.center,
    this.dayShapeBorder,
    this.onDatePressed,
    this.onDateLongPressed,
    this.decoration,
  });

  @override
  __DateItemState createState() => __DateItemState();
}

class __DateItemState extends State<DateItem> {
  Color? _defaultBackgroundColor;
  TextStyle? _defaultTextStyle;

  @override
  Widget build(BuildContext context) => widget.date != null
      ? CacheStreamBuilder<DateTime?>(
    cacheStream: widget.cacheStream,
    cacheBuilder: (_, data) {
      _defaultBackgroundColor = widget.backgroundColor;
      _defaultTextStyle = widget.dateStyle;
      if (compareDate(widget.date, widget.today)) {
        _defaultBackgroundColor = widget.todayBackgroundColor;
      } else if (!data.hasError && data.hasData) {
        final DateTime? dateSelected = data.data;
        if (compareDate(widget.date, dateSelected)) {
          _defaultBackgroundColor = widget.pressedBackgroundColor;
          _defaultTextStyle = widget.pressedDateStyle;
        }
      }
      return _body();
    },
  )
      : Container(
    width: 50,
    height: 50,
  );

  Widget _body() => Container(
    width: 50,
    height: 50,
    alignment: FractionalOffset.center,
    child: GestureDetector(
      onLongPress: _onLongPressed,
      child: GestureDetector(
        onTap: _onPressed,
        child: Container(
            decoration: BoxDecoration(
              color: _defaultBackgroundColor!,
              shape: widget.dayShapeBorder!,
            ),
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${widget.date!.day}',
                      style: _defaultTextStyle!,
                    ),
                  ),
                ),
                _decoration()
              ],
            )),
      ),
    ),
  );

  /// Decoration layout
  Widget _decoration() => Positioned(
    top:28,
    left: 0,
    right: 0,
    child: Container(
        width: 50,
        height: 12,
        alignment: widget.decorationAlignment,
        child: widget.decoration != null
            ? FittedBox(
          fit: BoxFit.scaleDown,
          child: widget.decoration!,
        )
            : Container()),
  );

  /// Handler press event
  void _onPressed() {
    if (widget.date != null) {
      widget.cacheStream.add(widget.date);
      widget.onDatePressed!(widget.date!);
    }
  }

  /// Handler long press event
  void _onLongPressed() {
    if (widget.date != null) {
      widget.cacheStream.add(widget.date);
      widget.onDateLongPressed!(widget.date!);
    }
  }
}
