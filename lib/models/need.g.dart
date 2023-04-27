// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'need.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NeedAdapter extends TypeAdapter<Need> {
  @override
  final int typeId = 2;

  @override
  Need read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Need(
      id: fields[0] as String,
      name: fields[1] as String,
      amount: fields[2] as int,
      imageUrl: fields[3] as String?,
      donor: fields[4] as String?,
      isDonated: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Need obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.donor)
      ..writeByte(5)
      ..write(obj.isDonated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
