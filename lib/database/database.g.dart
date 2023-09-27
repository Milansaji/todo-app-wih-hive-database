// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todolistAdapter extends TypeAdapter<todolist> {
  @override
  final int typeId = 0;

  @override
  todolist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todolist(
      description: fields[0] as String,
      isdone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, todolist obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isdone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todolistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
