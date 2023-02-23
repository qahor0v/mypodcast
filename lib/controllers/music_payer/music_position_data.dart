class MusicPositionData {
  final Duration position;
  final Duration? duration;
  final Duration bufferedPosition;

  MusicPositionData(
      {required this.position,
      required this.duration,
      required this.bufferedPosition});
}
