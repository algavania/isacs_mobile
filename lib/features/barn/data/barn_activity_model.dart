import 'package:freezed_annotation/freezed_annotation.dart';

part 'barn_activity_model.freezed.dart';
part 'barn_activity_model.g.dart';

@freezed
class BarnActivityModel with _$BarnActivityModel {
  const factory BarnActivityModel({
    @JsonKey(name: 'datetime')
    @MillisecondsSinceEpochConverter()
    required DateTime dateTime,
    required num temperature,
    required num humidity,
  }) = _BarnActivityModel;

  factory BarnActivityModel.fromJson(Map<String, Object?> json) =>
      _$BarnActivityModelFromJson(json);
}

class MillisecondsSinceEpochConverter implements JsonConverter<DateTime, int> {
  const MillisecondsSinceEpochConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
