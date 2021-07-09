class Moment {
  int hour;
  int minute;
  int second;

  Moment(
    this.hour,
    this.minute,
    this.second,
  );

  @override
  String toString() => '${hour.toString().padLeft(2, '0')}:'
      '${minute.toString().padLeft(2, '0')}:'
      '${second.toString().padLeft(2, '0')}';
}
