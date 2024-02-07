// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserConfigDataAdapter extends TypeAdapter<UserConfigData> {
  @override
  final int typeId = 4;

  @override
  UserConfigData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserConfigData(
      userId: fields[0] as String?,
      token: fields[1] as String?,
      selectedMarketId: fields[2] as String?,
      userName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserConfigData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.selectedMarketId)
      ..writeByte(3)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConfigDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
