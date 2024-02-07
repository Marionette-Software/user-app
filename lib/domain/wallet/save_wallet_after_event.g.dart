// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_wallet_after_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedWalletAfterEventAdapter
    extends TypeAdapter<SelectedWalletAfterEvent> {
  @override
  final int typeId = 3;

  @override
  SelectedWalletAfterEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedWalletAfterEvent(
      walletId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedWalletAfterEvent obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.walletId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedWalletAfterEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
