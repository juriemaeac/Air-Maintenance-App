// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      name: fields[1] as String?,
      lastName: fields[2] as String?,
      middleName: fields[3] as String?,
      accountID: fields[4] as String?,
      department: fields[5] as String?,
      userName: fields[6] as String?,
      password: fields[7] as String?,
      birthdate: fields[8] as String?,
      schoolYear: fields[9] as String?,
      schoolSection: fields[10] as String?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.birthdate)
      ..writeByte(9)
      ..write(obj.schoolYear)
      ..writeByte(10)
      ..write(obj.schoolSection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
