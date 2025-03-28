extension DateTimeExtensions on DateTime {
  String formatToReadable() {
    return "${this.day}/${this.month}/${this.year}";
  }

  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }
}
