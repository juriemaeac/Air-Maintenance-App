// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenanceTask_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaintenanceTaskAdapter extends TypeAdapter<MaintenanceTask> {
  @override
  final int typeId = 3;

  @override
  MaintenanceTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaintenanceTask(
      accountID: fields[1] as String?,
      taskCardNumber: fields[2] as String?,
      taskCardSpecification: fields[3] as String?,
      taskCardRevision: fields[4] as String?,
      taskCardRevisionDate: fields[5] as String?,
      woSpecification: fields[6] as String?,
      woScheduleStart: fields[7] as String?,
      location: fields[8] as String?,
      aircraftType: fields[9] as String?,
      acReg: fields[10] as String?,
      acSerial: fields[11] as String?,
      area: fields[12] as String?,
      student: fields[13] as String?,
      instructor: fields[14] as String?,
      taskCardType: fields[15] as String?,
      ata: fields[16] as String?,
      mmEffectivity: fields[17] as String?,
      ipcEffectivity: fields[18] as String?,
      manHours: fields[19] as String?,
      men: fields[20] as String?,
      user: fields[21] as String?,
      acRegA: fields[22] as String?,
      userA: fields[23] as String?,
      dateA: fields[24] as String?,
      itemNum: fields[25] as String?,
      userActionDescription: fields[26] as String?,
      studentB: fields[27] as String?,
      instructorB: fields[28] as String?,
      inspectorB: fields[29] as String?,
      submittedBy: fields[30] as String?,
      reviewedBy: fields[31] as String?,
      completedBy: fields[32] as String?,
      dateCompletionB: fields[33] as String?,
      departmentB: fields[34] as String?,
      acRegB: fields[35] as String?,
      userB: fields[36] as String?,
      dateB: fields[37] as String?,
      findingsA1: fields[38] as String?,
      findingsB1: fields[39] as String?,
      findingsLogbook1: fields[40] as String?,
      findingsSolution1: fields[41] as String?,
      findingsResult1: fields[42] as String?,
      findingsA2: fields[43] as String?,
      findingsB2: fields[44] as String?,
      findingsLogbook2: fields[45] as String?,
      findingsSolution2: fields[46] as String?,
      findingsResult2: fields[47] as String?,
      findingsA3: fields[48] as String?,
      findingsB3: fields[49] as String?,
      findingsLogbook3: fields[50] as String?,
      findingsSolution3: fields[51] as String?,
      findingsResult3: fields[52] as String?,
      findingsA4: fields[53] as String?,
      findingsB4: fields[54] as String?,
      findingsLogbook4: fields[55] as String?,
      findingsSolution4: fields[56] as String?,
      findingsResult4: fields[57] as String?,
      findingsA5: fields[58] as String?,
      findingsB5: fields[59] as String?,
      findingsLogbook5: fields[60] as String?,
      findingsSolution5: fields[61] as String?,
      findingsResult5: fields[62] as String?,
      findingsA6: fields[63] as String?,
      findingsB6: fields[64] as String?,
      findingsLogbook6: fields[65] as String?,
      findingsSolution6: fields[66] as String?,
      findingsResult6: fields[67] as String?,
      studentSignature: fields[68] as Uint8List?,
      instructorSignature: fields[69] as Uint8List?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, MaintenanceTask obj) {
    writer
      ..writeByte(70)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.accountID)
      ..writeByte(2)
      ..write(obj.taskCardNumber)
      ..writeByte(3)
      ..write(obj.taskCardSpecification)
      ..writeByte(4)
      ..write(obj.taskCardRevision)
      ..writeByte(5)
      ..write(obj.taskCardRevisionDate)
      ..writeByte(6)
      ..write(obj.woSpecification)
      ..writeByte(7)
      ..write(obj.woScheduleStart)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.aircraftType)
      ..writeByte(10)
      ..write(obj.acReg)
      ..writeByte(11)
      ..write(obj.acSerial)
      ..writeByte(12)
      ..write(obj.area)
      ..writeByte(13)
      ..write(obj.student)
      ..writeByte(14)
      ..write(obj.instructor)
      ..writeByte(15)
      ..write(obj.taskCardType)
      ..writeByte(16)
      ..write(obj.ata)
      ..writeByte(17)
      ..write(obj.mmEffectivity)
      ..writeByte(18)
      ..write(obj.ipcEffectivity)
      ..writeByte(19)
      ..write(obj.manHours)
      ..writeByte(20)
      ..write(obj.men)
      ..writeByte(21)
      ..write(obj.user)
      ..writeByte(22)
      ..write(obj.acRegA)
      ..writeByte(23)
      ..write(obj.userA)
      ..writeByte(24)
      ..write(obj.dateA)
      ..writeByte(25)
      ..write(obj.itemNum)
      ..writeByte(26)
      ..write(obj.userActionDescription)
      ..writeByte(27)
      ..write(obj.studentB)
      ..writeByte(28)
      ..write(obj.instructorB)
      ..writeByte(29)
      ..write(obj.inspectorB)
      ..writeByte(30)
      ..write(obj.submittedBy)
      ..writeByte(31)
      ..write(obj.reviewedBy)
      ..writeByte(32)
      ..write(obj.completedBy)
      ..writeByte(33)
      ..write(obj.dateCompletionB)
      ..writeByte(34)
      ..write(obj.departmentB)
      ..writeByte(35)
      ..write(obj.acRegB)
      ..writeByte(36)
      ..write(obj.userB)
      ..writeByte(37)
      ..write(obj.dateB)
      ..writeByte(38)
      ..write(obj.findingsA1)
      ..writeByte(39)
      ..write(obj.findingsB1)
      ..writeByte(40)
      ..write(obj.findingsLogbook1)
      ..writeByte(41)
      ..write(obj.findingsSolution1)
      ..writeByte(42)
      ..write(obj.findingsResult1)
      ..writeByte(43)
      ..write(obj.findingsA2)
      ..writeByte(44)
      ..write(obj.findingsB2)
      ..writeByte(45)
      ..write(obj.findingsLogbook2)
      ..writeByte(46)
      ..write(obj.findingsSolution2)
      ..writeByte(47)
      ..write(obj.findingsResult2)
      ..writeByte(48)
      ..write(obj.findingsA3)
      ..writeByte(49)
      ..write(obj.findingsB3)
      ..writeByte(50)
      ..write(obj.findingsLogbook3)
      ..writeByte(51)
      ..write(obj.findingsSolution3)
      ..writeByte(52)
      ..write(obj.findingsResult3)
      ..writeByte(53)
      ..write(obj.findingsA4)
      ..writeByte(54)
      ..write(obj.findingsB4)
      ..writeByte(55)
      ..write(obj.findingsLogbook4)
      ..writeByte(56)
      ..write(obj.findingsSolution4)
      ..writeByte(57)
      ..write(obj.findingsResult4)
      ..writeByte(58)
      ..write(obj.findingsA5)
      ..writeByte(59)
      ..write(obj.findingsB5)
      ..writeByte(60)
      ..write(obj.findingsLogbook5)
      ..writeByte(61)
      ..write(obj.findingsSolution5)
      ..writeByte(62)
      ..write(obj.findingsResult5)
      ..writeByte(63)
      ..write(obj.findingsA6)
      ..writeByte(64)
      ..write(obj.findingsB6)
      ..writeByte(65)
      ..write(obj.findingsLogbook6)
      ..writeByte(66)
      ..write(obj.findingsSolution6)
      ..writeByte(67)
      ..write(obj.findingsResult6)
      ..writeByte(68)
      ..write(obj.studentSignature)
      ..writeByte(69)
      ..write(obj.instructorSignature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
