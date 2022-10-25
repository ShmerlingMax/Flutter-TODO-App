import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class Task with _$Task {
  @HiveType(typeId: 0, adapterName: 'TaskAdapter')
  const factory Task({
    @HiveField(0) @Default('') String id,
    @HiveField(1) @Default('') String text,
    @HiveField(2) @Default('basic') String importance,
    @HiveField(3) @JsonKey(includeIfNull: false) int? deadline,
    @HiveField(4) @Default(false) bool done,
    @HiveField(5) @JsonKey(name: 'created_at') @Default(0) int created,
    @HiveField(6) @JsonKey(name: 'changed_at') @Default(0) int updated,
    @JsonKey(name: 'last_updated_by') @Default('0') String lastUpdatedBy,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
