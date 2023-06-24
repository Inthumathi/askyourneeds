
import 'package:askun_delivery_app/UI%20Screen/mycart/data_time/calander/weekdata.dart';
import 'package:askun_delivery_app/utilites/strings.dart';

List<WeekItem> separateWeeks(DateTime minDate, DateTime maxDate,
    List<String> dayOfWeek, List<String> _months) {
  int count = 1;
  final List<String> _dayOfWeek = [];
  final List<DateTime> _days = [];
  final List<WeekItem> _weeks = [];
  DateTime minDateCloned = DateTime(
      minDate.year,
      minDate.month,
      minDate.day,
      minDate.hour,
      minDate.minute,
      minDate.second,
      minDate.millisecond,
      minDate.microsecond);
  while (minDateCloned.compareTo(maxDate) < 1) {
    if (count < maxDayOfWeek) {
      _dayOfWeek.add(dayOfWeek[minDateCloned.weekday - 1]);
      _days.add(minDateCloned);
      count++;
    }
    else if (count == maxDayOfWeek) {
      count = 1;
      _dayOfWeek.add(dayOfWeek[minDateCloned.weekday - 1]);
      _days.add(minDateCloned);
      _weeks.add(WeekItem(
          month: _months[minDateCloned.month - 1],
          dayOfWeek: List.from(_dayOfWeek),
          days: List.from(_days)));
      _dayOfWeek.clear();
      _days.clear();
    }
    minDateCloned = minDateCloned.add(Duration(days: 1));
  }
  if (count > 1) {
    _weeks.add(WeekItem(
        month: _months[_days[0].month - 1],
        dayOfWeek: List.from(_dayOfWeek),
        days: List.from(_days)));
    _dayOfWeek.clear();
    _days.clear();
  }
  if (_weeks.isNotEmpty &&
      _weeks[_weeks.length - 1].dayOfWeek.length < maxDayOfWeek) {
    for (int i = 0; i < maxDayOfWeek; i++) {
      if (i > _weeks[_weeks.length - 1].dayOfWeek.length - 1) {
        _weeks[_weeks.length - 1].dayOfWeek.add(dayOfWeek[i]);
        _weeks[_weeks.length - 1].days.add(null);
      }
    }
  }
  return _weeks;
}
