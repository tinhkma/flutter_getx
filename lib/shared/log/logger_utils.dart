class Logger {
  static void write(String text, {bool isError = false}) {
    DateTime _nowTiming = new DateTime.now();
    print(
        '${DateTime(_nowTiming.year, _nowTiming.month, _nowTiming.day, _nowTiming.hour, _nowTiming.minute)} - ** $text [$isError]');
  }
}
