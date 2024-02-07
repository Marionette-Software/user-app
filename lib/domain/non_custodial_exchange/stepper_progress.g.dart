// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepper_progress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepperProgressAdapter extends TypeAdapter<StepperProgress> {
  @override
  final int typeId = 2;

  @override
  StepperProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepperProgress(
      authenticated: fields[0] as String?,
      isWalletConnect: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StepperProgress obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.authenticated)
      ..writeByte(1)
      ..write(obj.isWalletConnect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepperProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
