// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReflectionEntryAdapter extends TypeAdapter<ReflectionEntry> {
  @override
  final int typeId = 0;

  @override
  ReflectionEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReflectionEntry(
      date: fields[0] as DateTime,
      energy: fields[1] as int,
      focus: fields[2] as int,
      distraction: fields[3] as int,
      clarity: fields[4] as int,
      note: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReflectionEntry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.energy)
      ..writeByte(2)
      ..write(obj.focus)
      ..writeByte(3)
      ..write(obj.distraction)
      ..writeByte(4)
      ..write(obj.clarity)
      ..writeByte(5)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReflectionEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
