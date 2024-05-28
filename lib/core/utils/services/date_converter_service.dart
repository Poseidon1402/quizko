abstract class DateConverterService {
  static Duration convertToDuration(String duration) {
    List<String> parts = duration.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static String formatDuration(Duration duration) {
    return '${duration.inHours.toString().padLeft(2, '0')} : ${(duration.inMinutes % 60).toString().padLeft(2, '0')} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
