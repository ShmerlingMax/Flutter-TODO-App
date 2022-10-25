// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<_$_Task> {
  @override
  final int typeId = 0;

  @override
  _$_Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Task(
      id: fields[0] as String,
      text: fields[1] as String,
      importance: fields[2] as String,
      deadline: fields[3] as int?,
      done: fields[4] as bool,
      created: fields[5] as int,
      updated: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.importance)
      ..writeByte(3)
      ..write(obj.deadline)
      ..writeByte(4)
      ..write(obj.done)
      ..writeByte(5)
      ..write(obj.created)
      ..writeByte(6)
      ..write(obj.updated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String? ?? '',
      text: json['text'] as String? ?? '',
      importance: json['importance'] as String? ?? 'basic',
      deadline: json['deadline'] as int?,
      done: json['done'] as bool? ?? false,
      created: json['created_at'] as int? ?? 0,
      updated: json['changed_at'] as int? ?? 0,
      lastUpdatedBy: json['last_updated_by'] as String? ?? '0',
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'text': instance.text,
    'importance': instance.importance,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deadline', instance.deadline);
  val['done'] = instance.done;
  val['created_at'] = instance.created;
  val['changed_at'] = instance.updated;
  val['last_updated_by'] = instance.lastUpdatedBy;
  return val;
}
