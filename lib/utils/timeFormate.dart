String formateTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hour = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hour, minutes, seconds].join(':');
}
