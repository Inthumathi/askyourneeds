import 'dart:async';
import 'package:askun_delivery_app/UI%20Screen/mycart/data_time/calander/catchestream.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/data_time/calander/seperateweek.dart';
import 'package:askun_delivery_app/UI%20Screen/mycart/data_time/calander/weekdata.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:flutter/material.dart';

import 'calenderdata.dart';
import 'comparedata.dart';
import 'currentweekdata.dart';
import 'customscrollbehaviour.dart';
import 'datatime.dart';

class CalendarWeekController {

  DateTime _today = DateTime.now();
  bool _hasClient = false;
  bool get hasClient => _hasClient;
  DateTime? _selectedDate;
  DateTime get selectedDate => _selectedDate ?? _today;
  List<DateTime?> get rangeWeekDate => _weeks.isNotEmpty
      ? _weeks[_currentWeekIndex].days.where((ele) => ele != null).toList()
      : [];

  late Function(DateTime?) _widgetJumpToDate;
  int _currentWeekIndex = 0;
  final List<WeekItem> _weeks = [];

  void jumpToDate(DateTime date) {
    final _newCurrentWeekIndex = findCurrentWeekIndexByDate(date, _weeks);
    if (_newCurrentWeekIndex != -1) {
      _currentWeekIndex = _newCurrentWeekIndex;
      _selectedDate = date;
      _widgetJumpToDate(_selectedDate);
    }
  }
}

class CalendarWeek extends StatefulWidget {

  final DateTime minDate;
  final DateTime maxDate;
  final Widget Function(DateTime)? monthViewBuilder;
  final TextStyle dayOfWeekStyle;
  final TextStyle weekendsStyle;
  final FractionalOffset monthAlignment;
  final TextStyle dateStyle;
  final TextStyle todayDateStyle;
  final Color todayBackgroundColor;
  final Color datePressedBackgroundColor;
  final TextStyle datePressedStyle;
  final Color dateBackgroundColor;
  final void Function(DateTime) onDatePressed;
  final void Function(DateTime) onDateLongPressed;
  final Color backgroundColor;
  final List<String> daysOfWeek;
  final List<String> months;
  final bool monthDisplay;
  final List<int> weekendsIndexes;
  final EdgeInsets marginDayOfWeek;
  final EdgeInsets marginMonth;
  final BoxShape dayShapeBorder;
  final List<DecorationItem> decorations;
  final double height;
  final CalendarWeekController? controller;
  final Function() onWeekChanged;

  CalendarWeek._(
      Key? key,
      this.maxDate,
      this.minDate,
      this.height,
      this.monthViewBuilder,
      this.dayOfWeekStyle,
      this.monthAlignment,
      this.dateStyle,
      this.todayDateStyle,
      this.todayBackgroundColor,
      this.datePressedBackgroundColor,
      this.datePressedStyle,
      this.dateBackgroundColor,
      this.onDatePressed,
      this.onDateLongPressed,
      this.backgroundColor,
      this.daysOfWeek,
      this.months,
      this.monthDisplay,
      this.weekendsIndexes,
      this.weekendsStyle,
      this.marginMonth,
      this.marginDayOfWeek,
      this.dayShapeBorder,
      this.decorations,
      this.controller,
      this.onWeekChanged)
      : assert(daysOfWeek.length == 7),
        assert(months.length == 12),
        assert(minDate.isBefore(maxDate)),
        super(key: key);

  factory CalendarWeek(
      {Key? key,
        DateTime? maxDate,
        DateTime? minDate,
        double height = 150,
        Widget Function(DateTime)? monthViewBuilder,
        TextStyle dayOfWeekStyle =
        const TextStyle(color: Color(0xff2a3042), fontWeight: FontWeight.w600),
        FractionalOffset monthAlignment = FractionalOffset.center,
        TextStyle dateStyle =
        const TextStyle(color:Color(0xff2a3042), fontWeight: FontWeight.w400),
        TextStyle todayDateStyle = const TextStyle(
            color: Colors.orange, fontWeight: FontWeight.w400),
        Color todayBackgroundColor = Colors.black12,
        Color pressedDateBackgroundColor = const  Color(0xFFfdba12),
        TextStyle pressedDateStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        Color dateBackgroundColor = Colors.transparent,
        Function(DateTime)? onDatePressed,
        Function(DateTime)? onDateLongPressed,
        Color backgroundColor = Colors.white,
        List<String> dayOfWeek = dayOfWeekDefault,
        List<String> month = monthDefaults,
        bool showMonth = true,
        List<int> weekendsIndexes = weekendsIndexesDefault,
        TextStyle weekendsStyle =
        const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        EdgeInsets marginMonth = const EdgeInsets.symmetric(vertical: 4),
        EdgeInsets marginDayOfWeek = const EdgeInsets.symmetric(vertical: 4),
        BoxShape dayShapeBorder = BoxShape.circle,
        List<DecorationItem> decorations = const [],
        CalendarWeekController? controller,
        Function()? onWeekChanged}) =>
      CalendarWeek._(
          key,
          maxDate ?? DateTime.now().add(Duration(days: 180)),
          minDate ?? DateTime.now().add(Duration(days: -180)),
          height,
          monthViewBuilder,
          dayOfWeekStyle,
          monthAlignment,
          dateStyle,
          todayDateStyle,
          todayBackgroundColor,
          pressedDateBackgroundColor,
          pressedDateStyle,
          dateBackgroundColor,
          onDatePressed ?? (DateTime date) {},
          onDateLongPressed ?? (DateTime date) {},
          backgroundColor,
          dayOfWeek,
          month,
          showMonth,
          weekendsIndexes,
          weekendsStyle,
          marginMonth,
          marginDayOfWeek,
          dayShapeBorder,
          decorations,
          controller,
          onWeekChanged ?? () {});

  @override
  _CalendarWeekState createState() => _CalendarWeekState();
}

class _CalendarWeekState extends State<CalendarWeek> {
  final CacheStream<DateTime?> _cacheStream = CacheStream<DateTime?>();
  Stream<DateTime?>? _stream;
  late PageController _pageController;
  CalendarWeekController _defaultCalendarController = CalendarWeekController();
  CalendarWeekController get controller =>
      widget.controller ?? _defaultCalendarController;

  void _jumToDateHandler(DateTime? dateTime) {
    _cacheStream.add(dateTime);
    _pageController.animateToPage(widget.controller!._currentWeekIndex,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _setUp() {
    assert(controller.hasClient == false);
    _stream ??= _cacheStream.stream!.asBroadcastStream();
    controller
      .._weeks.clear()
      .._weeks.addAll(separateWeeks(
          widget.minDate, widget.maxDate, widget.daysOfWeek, widget.months))
      .._currentWeekIndex =
      findCurrentWeekIndexByDate(controller._today, controller._weeks)
      .._widgetJumpToDate = _jumToDateHandler
      .._hasClient = true;

    _pageController = PageController(initialPage: controller._currentWeekIndex);
  }

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) => _body();

  Widget _body() => Container(
      color: widget.backgroundColor,
      width: double.infinity,
      height: widget.height,
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: PageView.builder(
          controller: _pageController,
          itemCount: controller._weeks.length,
          onPageChanged: (currentPage) {
            widget.controller!._currentWeekIndex = currentPage;
            widget.onWeekChanged();
          },
          itemBuilder: (_, i) =>   _week(controller._weeks[i]),
        ),
      ));

  Widget _week(WeekItem weeks) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      // Month
      (widget.monthDisplay &&
          widget.monthViewBuilder != null &&
          weeks.days.firstWhere((el) => el != null) != null)
          ? widget
          .monthViewBuilder!(weeks.days.firstWhere((el) => el != null)!)
          : _monthItem(weeks.month),

      _dayOfWeek(weeks.dayOfWeek),

      _dates(weeks.days)
    ],
  );

  Widget _monthItem(String title) => Align(
    alignment: widget.monthAlignment,
    child: Container(
        margin: widget.marginMonth,
        child: Text(
          title,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )),
  );

  Widget _dayOfWeek(List<String> dayOfWeek) => Container(
    margin: widget.marginDayOfWeek,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: dayOfWeek.map(_dayOfWeekItem).toList()),
  );

  Widget _dayOfWeekItem(String title) => Container(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width:50,
          child: Text(
            title,
            style: widget.weekendsIndexes
                .indexOf(widget.daysOfWeek.indexOf(title)) !=
                -1
                ? widget.weekendsStyle
                : widget.dayOfWeekStyle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ));

  Widget _dates(List<DateTime?> dates) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dates.map(_dateItem).toList());

  Widget _dateItem(DateTime? date) => DateItem(
      today: controller._today,
      date: date,
      dateStyle: compareDate(date, controller._today)
          ? widget.todayDateStyle
          : date != null && (date.weekday == 6 || date.weekday == 7)
          ? widget.weekendsStyle
          : widget.dateStyle,
      pressedDateStyle: widget.datePressedStyle,
      backgroundColor: widget.dateBackgroundColor,
      todayBackgroundColor: widget.todayBackgroundColor,
      pressedBackgroundColor: widget.datePressedBackgroundColor,
      decorationAlignment: () {
        if (widget.decorations.isNotEmpty) {
          final List<DecorationItem> matchDate = widget.decorations
              .where((ele) => compareDate(ele.date, date))
              .toList();
          return matchDate.isNotEmpty
              ? matchDate[0].decorationAlignment
              : FractionalOffset.center;
        }
        return FractionalOffset.center;
      }(),
      dayShapeBorder: widget.dayShapeBorder,
      onDatePressed: (datePressed) {
        controller._selectedDate = datePressed;
        widget.onDatePressed(datePressed);
      },
      onDateLongPressed: (datePressed) {
        controller._selectedDate = datePressed;
        widget.onDateLongPressed(datePressed);
      },
      decoration: () {
        if (widget.decorations.isNotEmpty) {
          final List<DecorationItem> matchDate = widget.decorations
              .where((ele) => compareDate(ele.date, date))
              .toList();
          return matchDate.isNotEmpty ? matchDate[0].decoration : null;
        }
        return null;
      }(),
      cacheStream: _cacheStream);

  @override
  void dispose() {
    super.dispose();
    _cacheStream.close();
  }
}
