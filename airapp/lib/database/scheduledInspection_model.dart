import 'package:hive/hive.dart';
part 'scheduledInspection_model.g.dart';

@HiveType(typeId: 2)
class ScheduledInspection extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? accountID;
  @HiveField(2)
  String? inspectionDate;
  @HiveField(3)
  int? sipA11Findings;
  @HiveField(4)
  String? sipA11Initials;
  @HiveField(5)
  int? sipA2Findings;
  @HiveField(6)
  String? sipA2Initials;
  @HiveField(7)
  int? sipA3Findings;
  @HiveField(8)
  String? sipA3Initials;
  @HiveField(9)
  int? sipA4Findings;
  @HiveField(10)
  String? sipA4Initials;
  @HiveField(11)
  int? sipA5Findings;
  @HiveField(12)
  String? sipA5Initials;
  @HiveField(13)
  int? sipA6Findings;
  @HiveField(14)
  String? sipA6Initials;
  @HiveField(15)
  int? sipA7Findings;
  @HiveField(16)
  String? sipA7Initials;
  //--------------------------------------------------------//
  @HiveField(17)
  int? sipB1Findings;
  @HiveField(18)
  String? sipB1Initials;
  @HiveField(19)
  int? sipB21Findings;
  @HiveField(20)
  String? sipB21Initials;
  @HiveField(21)
  int? sipB22Findings;
  @HiveField(22)
  String? sipB22Initials;
  @HiveField(23)
  int? sipB23Findings;
  @HiveField(24)
  String? sipB23Initials;
  @HiveField(25)
  int? sipB24Findings;
  @HiveField(26)
  String? sipB24Initials;
  @HiveField(27)
  int? sipB25Findings;
  @HiveField(28)
  String? sipB25Initials;
  @HiveField(29)
  int? sipB31Findings;
  @HiveField(30)
  String? sipB31Initials;
  @HiveField(31)
  int? sipB32Findings;
  @HiveField(32)
  String? sipB32Initials;
  @HiveField(33)
  int? sipB41Findings;
  @HiveField(34)
  String? sipB41Initials;
  @HiveField(35)
  int? sipB42Findings;
  @HiveField(36)
  String? sipB42Initials;
  @HiveField(37)
  int? sipB43Findings;
  @HiveField(38)
  String? sipB43Initials;
  @HiveField(39)
  int? sipB44Findings;
  @HiveField(40)
  String? sipB44Initials;
  @HiveField(41)
  int? sipB51Findings;
  @HiveField(42)
  String? sipB51Initials;
  @HiveField(43)
  int? sipB52Findings;
  @HiveField(44)
  String? sipB52Initials;
  @HiveField(45)
  int? sipB53Findings;
  @HiveField(46)
  String? sipB53Initials;
  @HiveField(47)
  int? sipB54Findings;
  @HiveField(48)
  String? sipB54Initials;
  @HiveField(49)
  int? sipB55Findings;
  @HiveField(50)
  String? sipB55Initials;
  @HiveField(51)
  int? sipB61Findings;
  @HiveField(52)
  String? sipB61Initials;
  @HiveField(53)
  int? sipB62Findings;
  @HiveField(54)
  String? sipB62Initials;
  @HiveField(55)
  int? sipB63Findings;
  @HiveField(56)
  String? sipB63Initials;
  @HiveField(57)
  int? sipB64Findings;
  @HiveField(58)
  String? sip64Initials;
  @HiveField(59)
  int? sipB71Findings;
  @HiveField(60)
  String? sipB71Initials;
  @HiveField(61)
  int? sipB72Findings;
  @HiveField(62)
  String? sipB72Initials;
  @HiveField(63)
  int? sipB73Findings;
  @HiveField(64)
  String? sipB73Initials;
  @HiveField(65)
  int? sipB74Findings;
  @HiveField(66)
  String? sipB74Initials;
  @HiveField(67)
  int? sipB75Findings;
  @HiveField(68)
  String? sipB75Initials;
  @HiveField(69)
  int? sipB81Findings;
  @HiveField(70)
  String? sipB81Initials;
  @HiveField(71)
  int? sipB82Findings;
  @HiveField(72)
  String? sipB82Initials;
  @HiveField(73)
  int? sipB83Findings;
  @HiveField(74)
  String? sipB83Initials;
  @HiveField(75)
  int? sipB84Findings;
  @HiveField(76)
  String? sipB84Initials;
  @HiveField(77)
  int? sipB85Findings;
  @HiveField(78)
  String? sipB85Initials;
  @HiveField(79)
  int? sipB86Findings;
  @HiveField(80)
  String? sipB86Initials;
  @HiveField(81)
  int? sipB91Findings;
  @HiveField(82)
  String? sipB91Initials;
  @HiveField(83)
  int? sipB92Findings;
  @HiveField(84)
  String? sipB92Initials;
  @HiveField(85)
  int? sipA12Findings;
  @HiveField(86)
  String? sipA12Initials;
  @HiveField(87)
  int? sipA13Findings;
  @HiveField(88)
  String? sipA13Initials;
  @HiveField(89)
  int? sipA14Findings;
  @HiveField(90)
  String? sipA14Initials;

  ScheduledInspection({
    required this.accountID,
    required this.inspectionDate,
    required this.sipA11Findings,
    required this.sipA11Initials,
    required this.sipA12Findings,
    required this.sipA12Initials,
    required this.sipA13Findings,
    required this.sipA13Initials,
    required this.sipA14Findings,
    required this.sipA14Initials,
    required this.sipA2Findings,
    required this.sipA2Initials,
    required this.sipA3Findings,
    required this.sipA3Initials,
    required this.sipA4Findings,
    required this.sipA4Initials,
    required this.sipA5Findings,
    required this.sipA5Initials,
    required this.sipA6Findings,
    required this.sipA6Initials,
    required this.sipA7Findings,
    required this.sipA7Initials,
    required this.sipB1Findings,
    required this.sipB1Initials,
    required this.sipB21Findings,
    required this.sipB21Initials,
    required this.sipB22Findings,
    required this.sipB22Initials,
    required this.sipB23Findings,
    required this.sipB23Initials,
    required this.sipB24Findings,
    required this.sipB24Initials,
    required this.sipB25Findings,
    required this.sipB25Initials,
    required this.sipB31Findings,
    required this.sipB31Initials,
    required this.sipB32Findings,
    required this.sipB32Initials,
    required this.sipB41Findings,
    required this.sipB41Initials,
    required this.sipB42Findings,
    required this.sipB42Initials,
    required this.sipB43Findings,
    required this.sipB43Initials,
    required this.sipB44Findings,
    required this.sipB44Initials,
    required this.sipB51Findings,
    required this.sipB51Initials,
    required this.sipB52Findings,
    required this.sipB52Initials,
    required this.sipB53Findings,
    required this.sipB53Initials,
    required this.sipB54Findings,
    required this.sipB54Initials,
    required this.sipB55Findings,
    required this.sipB55Initials,
    required this.sipB61Findings,
    required this.sipB61Initials,
    required this.sipB62Findings,
    required this.sipB62Initials,
    required this.sipB63Findings,
    required this.sipB63Initials,
    required this.sipB64Findings,
    required this.sip64Initials,
    required this.sipB71Findings,
    required this.sipB71Initials,
    required this.sipB72Findings,
    required this.sipB72Initials,
    required this.sipB73Findings,
    required this.sipB73Initials,
    required this.sipB74Findings,
    required this.sipB74Initials,
    required this.sipB75Findings,
    required this.sipB75Initials,
    required this.sipB81Findings,
    required this.sipB81Initials,
    required this.sipB82Findings,
    required this.sipB82Initials,
    required this.sipB83Findings,
    required this.sipB83Initials,
    required this.sipB84Findings,
    required this.sipB84Initials,
    required this.sipB85Findings,
    required this.sipB85Initials,
    required this.sipB86Findings,
    required this.sipB86Initials,
    required this.sipB91Findings,
    required this.sipB91Initials,
    required this.sipB92Findings,
    required this.sipB92Initials,
  });
}
