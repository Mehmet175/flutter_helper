
extension DateTimeToString on DateTime {
  String toDateString() => "${day < 10 ? "0$day" : day}."
      "${month < 10 ? "0$month" : month}."
      "${year < 10 ? "0$year" : year}";

  String toDateTimeString() => "${day < 10 ? "0$day" : day}."
      "${month < 10 ? "0$month" : month}."
      "${year < 10 ? "0$year" : year} ${hour < 10 ? "0$hour" : hour}.${minute < 10 ? "0$minute" : minute}";
}
