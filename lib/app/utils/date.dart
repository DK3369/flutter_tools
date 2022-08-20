import 'package:date_format/date_format.dart';

int getInDays(DateTime day, DateTime today) {
  final day_y = int.parse(formatDate(day, ['yyyy']));
  final day_m = int.parse(formatDate(day, ['mm']));
  final day_d = int.parse(formatDate(day, ['dd']));

  final today_y = int.parse(formatDate(today, ['yyyy']));
  final today_m = int.parse(formatDate(today, ['mm']));
  final today_d = int.parse(formatDate(today, ['dd']));

  return DateTime(today_y, today_m, today_d)
      .difference(DateTime(day_y, day_m, day_d))
      .inDays;
}

/// 展示最新消息时间
String getSessionTmie(int time) {
  final day = DateTime.fromMillisecondsSinceEpoch(time);
  final _day = DateTime.now();
  final today = formatDate(_day, ['yyyy', 'mm', 'dd']);
  final date = formatDate(day, ['yyyy', 'mm', 'dd']);
  final today_y = formatDate(_day, ['yyyy']);
  final date_y = formatDate(day, ['yyyy']);
  if (time == 0) {
    return '';
  }
  // 今天
  if (today == date) {
    return getTodayTime(day);
  } else if (today_y == date_y) {
    // 本年
    final days = getInDays(day, _day);
    if (days == 1) {
      //昨天
      return getYesterdayTime(day);
    } else if (days < 7) {
      // 本周
      return getWeekTime(day);
    }
    return formatDate(day, [mm, '月', dd, '日']);
  } else {
    /// 往年
    return formatDate(day, [yyyy, '年', mm, '月', dd, '日']);
  }
}

String getYesterdayTime(DateTime time) {
  String toDay = formatDate(time, [HH, ':', nn]);
  return '昨天 $toDay';
}

String getTodayTime(DateTime time) {
  String toDay = formatDate(time, [HH, ':', nn]);
  int hour = int.parse(formatDate(time, [HH]));
  if (hour >= 5 && hour <= 10) {
    return '上午 $toDay';
  } else if (hour >= 11 && hour <= 12) {
    return '中午 $toDay';
  } else if (hour >= 13 && hour <= 17) {
    return '下午 $toDay';
  } else if (hour >= 18 && hour <= 23) {
    return '晚上 $toDay';
  } else {
    return '凌晨 $toDay';
  }
}

String getWeekTime(DateTime time) {
  Map weekMap = {
    'Monday': '周一',
    'Tuesday': '周二',
    'Wednesday': '周三',
    'Thursday': '周四',
    'Friday': '周五',
    'Saturday': '周六',
    'Sunday': '周日'
  };
  final week = formatDate(time, [DD]);
  String toDay = formatDate(time, [HH, ':', nn]);
  return '${weekMap[week]} $toDay';
}
