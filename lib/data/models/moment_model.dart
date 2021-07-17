import '../../domain/entities/moment.dart';

class MomentModel extends Moment {
  MomentModel(int hour, int minute, int second) : super(hour, minute, second);

  factory MomentModel.fromJson(Map<String, dynamic> json) => MomentModel(
        json['hour'],
        json['minute'],
        json['second'],
      );
}
