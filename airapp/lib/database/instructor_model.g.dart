// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstructorAdapter extends TypeAdapter<Instructor> {
  @override
  final int typeId = 0;

  @override
  Instructor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Instructor(
      name: fields[1] as String?,
      lastName: fields[2] as String?,
      middleName: fields[3] as String?,
      accountID: fields[4] as String?,
      department: fields[5] as String?,
      userName: fields[6] as String?,
      password: fields[7] as String?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Instructor obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.middleName)
      ..writeByte(4)
      ..write(obj.accountID)
      ..writeByte(5)
      ..write(obj.department)
      ..writeByte(6)
      ..write(obj.userName)
      ..writeByte(7)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
