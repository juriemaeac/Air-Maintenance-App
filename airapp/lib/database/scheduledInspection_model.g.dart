// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduledInspection_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledInspectionAdapter extends TypeAdapter<ScheduledInspection> {
  @override
  final int typeId = 2;

  @override
  ScheduledInspection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledInspection(
      accountID: fields[1] as String?,
      inspectionDate: fields[2] as String?,
      sipA11Findings: fields[3] as int?,
      sipA11Initials: fields[4] as String?,
      sipA12Findings: fields[85] as int?,
      sipA12Initials: fields[86] as String?,
      sipA13Findings: fields[87] as int?,
      sipA13Initials: fields[88] as String?,
      sipA14Findings: fields[89] as int?,
      sipA14Initials: fields[90] as String?,
      sipA2Findings: fields[5] as int?,
      sipA2Initials: fields[6] as String?,
      sipA3Findings: fields[7] as int?,
      sipA3Initials: fields[8] as String?,
      sipA4Findings: fields[9] as int?,
      sipA4Initials: fields[10] as String?,
      sipA5Findings: fields[11] as int?,
      sipA5Initials: fields[12] as String?,
      sipA6Findings: fields[13] as int?,
      sipA6Initials: fields[14] as String?,
      sipA7Findings: fields[15] as int?,
      sipA7Initials: fields[16] as String?,
      sipB1Findings: fields[17] as int?,
      sipB1Initials: fields[18] as String?,
      sipB21Findings: fields[19] as int?,
      sipB21Initials: fields[20] as String?,
      sipB22Findings: fields[21] as int?,
      sipB22Initials: fields[22] as String?,
      sipB23Findings: fields[23] as int?,
      sipB23Initials: fields[24] as String?,
      sipB24Findings: fields[25] as int?,
      sipB24Initials: fields[26] as String?,
      sipB25Findings: fields[27] as int?,
      sipB25Initials: fields[28] as String?,
      sipB31Findings: fields[29] as int?,
      sipB31Initials: fields[30] as String?,
      sipB32Findings: fields[31] as int?,
      sipB32Initials: fields[32] as String?,
      sipB41Findings: fields[33] as int?,
      sipB41Initials: fields[34] as String?,
      sipB42Findings: fields[35] as int?,
      sipB42Initials: fields[36] as String?,
      sipB43Findings: fields[37] as int?,
      sipB43Initials: fields[38] as String?,
      sipB44Findings: fields[39] as int?,
      sipB44Initials: fields[40] as String?,
      sipB51Findings: fields[41] as int?,
      sipB51Initials: fields[42] as String?,
      sipB52Findings: fields[43] as int?,
      sipB52Initials: fields[44] as String?,
      sipB53Findings: fields[45] as int?,
      sipB53Initials: fields[46] as String?,
      sipB54Findings: fields[47] as int?,
      sipB54Initials: fields[48] as String?,
      sipB55Findings: fields[49] as int?,
      sipB55Initials: fields[50] as String?,
      sipB61Findings: fields[51] as int?,
      sipB61Initials: fields[52] as String?,
      sipB62Findings: fields[53] as int?,
      sipB62Initials: fields[54] as String?,
      sipB63Findings: fields[55] as int?,
      sipB63Initials: fields[56] as String?,
      sipB64Findings: fields[57] as int?,
      sip64Initials: fields[58] as String?,
      sipB71Findings: fields[59] as int?,
      sipB71Initials: fields[60] as String?,
      sipB72Findings: fields[61] as int?,
      sipB72Initials: fields[62] as String?,
      sipB73Findings: fields[63] as int?,
      sipB73Initials: fields[64] as String?,
      sipB74Findings: fields[65] as int?,
      sipB74Initials: fields[66] as String?,
      sipB75Findings: fields[67] as int?,
      sipB75Initials: fields[68] as String?,
      sipB81Findings: fields[69] as int?,
      sipB81Initials: fields[70] as String?,
      sipB82Findings: fields[71] as int?,
      sipB82Initials: fields[72] as String?,
      sipB83Findings: fields[73] as int?,
      sipB83Initials: fields[74] as String?,
      sipB84Findings: fields[75] as int?,
      sipB84Initials: fields[76] as String?,
      sipB85Findings: fields[77] as int?,
      sipB85Initials: fields[78] as String?,
      sipB86Findings: fields[79] as int?,
      sipB86Initials: fields[80] as String?,
      sipB91Findings: fields[81] as int?,
      sipB91Initials: fields[82] as String?,
      sipB92Findings: fields[83] as int?,
      sipB92Initials: fields[84] as String?,
      studentSignature: fields[91] as Uint8List?,
      instructorSignature: fields[92] as Uint8List?,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, ScheduledInspection obj) {
    writer
      ..writeByte(93)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.accountID)
      ..writeByte(2)
      ..write(obj.inspectionDate)
      ..writeByte(3)
      ..write(obj.sipA11Findings)
      ..writeByte(4)
      ..write(obj.sipA11Initials)
      ..writeByte(5)
      ..write(obj.sipA2Findings)
      ..writeByte(6)
      ..write(obj.sipA2Initials)
      ..writeByte(7)
      ..write(obj.sipA3Findings)
      ..writeByte(8)
      ..write(obj.sipA3Initials)
      ..writeByte(9)
      ..write(obj.sipA4Findings)
      ..writeByte(10)
      ..write(obj.sipA4Initials)
      ..writeByte(11)
      ..write(obj.sipA5Findings)
      ..writeByte(12)
      ..write(obj.sipA5Initials)
      ..writeByte(13)
      ..write(obj.sipA6Findings)
      ..writeByte(14)
      ..write(obj.sipA6Initials)
      ..writeByte(15)
      ..write(obj.sipA7Findings)
      ..writeByte(16)
      ..write(obj.sipA7Initials)
      ..writeByte(17)
      ..write(obj.sipB1Findings)
      ..writeByte(18)
      ..write(obj.sipB1Initials)
      ..writeByte(19)
      ..write(obj.sipB21Findings)
      ..writeByte(20)
      ..write(obj.sipB21Initials)
      ..writeByte(21)
      ..write(obj.sipB22Findings)
      ..writeByte(22)
      ..write(obj.sipB22Initials)
      ..writeByte(23)
      ..write(obj.sipB23Findings)
      ..writeByte(24)
      ..write(obj.sipB23Initials)
      ..writeByte(25)
      ..write(obj.sipB24Findings)
      ..writeByte(26)
      ..write(obj.sipB24Initials)
      ..writeByte(27)
      ..write(obj.sipB25Findings)
      ..writeByte(28)
      ..write(obj.sipB25Initials)
      ..writeByte(29)
      ..write(obj.sipB31Findings)
      ..writeByte(30)
      ..write(obj.sipB31Initials)
      ..writeByte(31)
      ..write(obj.sipB32Findings)
      ..writeByte(32)
      ..write(obj.sipB32Initials)
      ..writeByte(33)
      ..write(obj.sipB41Findings)
      ..writeByte(34)
      ..write(obj.sipB41Initials)
      ..writeByte(35)
      ..write(obj.sipB42Findings)
      ..writeByte(36)
      ..write(obj.sipB42Initials)
      ..writeByte(37)
      ..write(obj.sipB43Findings)
      ..writeByte(38)
      ..write(obj.sipB43Initials)
      ..writeByte(39)
      ..write(obj.sipB44Findings)
      ..writeByte(40)
      ..write(obj.sipB44Initials)
      ..writeByte(41)
      ..write(obj.sipB51Findings)
      ..writeByte(42)
      ..write(obj.sipB51Initials)
      ..writeByte(43)
      ..write(obj.sipB52Findings)
      ..writeByte(44)
      ..write(obj.sipB52Initials)
      ..writeByte(45)
      ..write(obj.sipB53Findings)
      ..writeByte(46)
      ..write(obj.sipB53Initials)
      ..writeByte(47)
      ..write(obj.sipB54Findings)
      ..writeByte(48)
      ..write(obj.sipB54Initials)
      ..writeByte(49)
      ..write(obj.sipB55Findings)
      ..writeByte(50)
      ..write(obj.sipB55Initials)
      ..writeByte(51)
      ..write(obj.sipB61Findings)
      ..writeByte(52)
      ..write(obj.sipB61Initials)
      ..writeByte(53)
      ..write(obj.sipB62Findings)
      ..writeByte(54)
      ..write(obj.sipB62Initials)
      ..writeByte(55)
      ..write(obj.sipB63Findings)
      ..writeByte(56)
      ..write(obj.sipB63Initials)
      ..writeByte(57)
      ..write(obj.sipB64Findings)
      ..writeByte(58)
      ..write(obj.sip64Initials)
      ..writeByte(59)
      ..write(obj.sipB71Findings)
      ..writeByte(60)
      ..write(obj.sipB71Initials)
      ..writeByte(61)
      ..write(obj.sipB72Findings)
      ..writeByte(62)
      ..write(obj.sipB72Initials)
      ..writeByte(63)
      ..write(obj.sipB73Findings)
      ..writeByte(64)
      ..write(obj.sipB73Initials)
      ..writeByte(65)
      ..write(obj.sipB74Findings)
      ..writeByte(66)
      ..write(obj.sipB74Initials)
      ..writeByte(67)
      ..write(obj.sipB75Findings)
      ..writeByte(68)
      ..write(obj.sipB75Initials)
      ..writeByte(69)
      ..write(obj.sipB81Findings)
      ..writeByte(70)
      ..write(obj.sipB81Initials)
      ..writeByte(71)
      ..write(obj.sipB82Findings)
      ..writeByte(72)
      ..write(obj.sipB82Initials)
      ..writeByte(73)
      ..write(obj.sipB83Findings)
      ..writeByte(74)
      ..write(obj.sipB83Initials)
      ..writeByte(75)
      ..write(obj.sipB84Findings)
      ..writeByte(76)
      ..write(obj.sipB84Initials)
      ..writeByte(77)
      ..write(obj.sipB85Findings)
      ..writeByte(78)
      ..write(obj.sipB85Initials)
      ..writeByte(79)
      ..write(obj.sipB86Findings)
      ..writeByte(80)
      ..write(obj.sipB86Initials)
      ..writeByte(81)
      ..write(obj.sipB91Findings)
      ..writeByte(82)
      ..write(obj.sipB91Initials)
      ..writeByte(83)
      ..write(obj.sipB92Findings)
      ..writeByte(84)
      ..write(obj.sipB92Initials)
      ..writeByte(85)
      ..write(obj.sipA12Findings)
      ..writeByte(86)
      ..write(obj.sipA12Initials)
      ..writeByte(87)
      ..write(obj.sipA13Findings)
      ..writeByte(88)
      ..write(obj.sipA13Initials)
      ..writeByte(89)
      ..write(obj.sipA14Findings)
      ..writeByte(90)
      ..write(obj.sipA14Initials)
      ..writeByte(91)
      ..write(obj.studentSignature)
      ..writeByte(92)
      ..write(obj.instructorSignature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledInspectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
