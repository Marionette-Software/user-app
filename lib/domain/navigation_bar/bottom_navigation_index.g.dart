// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BottomNavigationIndexDataAdapter
    extends TypeAdapter<BottomNavigationIndexData> {
  @override
  final int typeId = 5;

  @override
  BottomNavigationIndexData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BottomNavigationIndexData(
      selectedIndex: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BottomNavigationIndexData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.selectedIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BottomNavigationIndexDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
