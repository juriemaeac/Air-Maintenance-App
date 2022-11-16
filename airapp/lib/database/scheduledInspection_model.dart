import 'package:hive/hive.dart';
//part 'scheduledInspection_model.dart';

class ScheduledInspection extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? accountID;
  @HiveField(2)
  String? inspectionDate;
  @HiveField(3)
  int? sipA1Findings;
  @HiveField(4)
  String? sipA1Initials;
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
  int? sipB2Findings;
  @HiveField(20)
  String? sipB2Initials;
  @HiveField(21)
  int? sipB21Findings;
  @HiveField(22)
  String? sipB21Initials;
  @HiveField(23)
  int? sipB22Findings;
  @HiveField(24)
  String? sipB22Initials;
  @HiveField(25)
  int? sipB23Findings;
  @HiveField(26)
  String? sipB23Initials;
  @HiveField(27)
  int? sipB24Findings;
  @HiveField(28)
  String? sipB24Initials;
  @HiveField(29)
  int? sipB25Findings;
  @HiveField(30)
  String? sipB25Initials;
  @HiveField(31)
  int? sipB3Findings;
  @HiveField(32)
  String? sipB3Initials;
  @HiveField(33)
  int? sipB31Findings;
  @HiveField(34)
  String? sipB31Initials;
  @HiveField(35)
  int? sipB32Findings;
  @HiveField(36)
  String? sipB32Initials;
  @HiveField(37)
  int? sipB4Findings;
  @HiveField(38)
  String? sipB4Initials;
  @HiveField(39)
  int? sipB41Findings;
  @HiveField(40)
  String? sipB41Initials;
  @HiveField(41)
  int? sipB42Findings;
  @HiveField(42)
  String? sipB42Initials;
  @HiveField(43)
  int? sipB43Findings;
  @HiveField(44)
  String? sipB43Initials;
  @HiveField(45)
  int? sipB44Findings;
  @HiveField(46)
  String? sipB44Initials;
  @HiveField(47)
  int? sipB5Findings;
  @HiveField(48)
  String? sipB5Initials;
  @HiveField(49)
  int? sipB51Findings;
  @HiveField(50)
  String? sipB51Initials;
  @HiveField(51)
  int? sipB52Findings;
  @HiveField(52)
  String? sipB52Initials;
  @HiveField(53)
  int? sipB53Findings;
  @HiveField(54)
  String? sipB53Initials;
  @HiveField(55)
  int? sipB54Findings;
  @HiveField(56)
  String? sipB54Initials;
  @HiveField(57)
  int? sipB55Findings;
  @HiveField(58)
  String? sipB55Initials;
  @HiveField(59)
  int? sipB6Findings;
  @HiveField(60)
  String? sipB6Initials;
  @HiveField(61)
  int? sipB61Findings;
  @HiveField(62)
  String? sipB61Initials;
  @HiveField(63)
  int? sipB62Findings;
  @HiveField(64)
  String? sipB62Initials;
  @HiveField(65)
  int? sipB63Findings;
  @HiveField(66)
  String? sipB63Initials;
  @HiveField(67)
  int? sipB64Findings;
  @HiveField(68)
  String? sip64Initials;
  @HiveField(69)
  int? sipB7Findings;
  @HiveField(70)
  String? sipB7Initials;
  @HiveField(71)
  int? sipB71Findings;
  @HiveField(72)
  String? sipB71Initials;
  @HiveField(73)
  int? sipB72Findings;
  @HiveField(74)
  String? sipB72Initials;
  @HiveField(75)
  int? sipB73Findings;
  @HiveField(76)
  String? sipB73Initials;
  @HiveField(77)
  int? sipB74Findings;
  @HiveField(78)
  String? sipB74Initials;
  @HiveField(79)
  int? sipB75Findings;
  @HiveField(80)
  String? sipB75Initials;
  @HiveField(81)
  int? sipB8Findings;
  @HiveField(82)
  String? sipB8Initials;
  @HiveField(83)
  int? sipB81Findings;
  @HiveField(84)
  String? sipB81Initials;
  @HiveField(85)
  int? sipB82Findings;
  @HiveField(86)
  String? sipB82Initials;
  @HiveField(87)
  int? sipB83Findings;
  @HiveField(88)
  String? sipB83Initials;
  @HiveField(89)
  int? sipB84Findings;
  @HiveField(90)
  String? sipB84Initials;
  @HiveField(91)
  int? sipB85Findings;
  @HiveField(92)
  String? sipB85Initials;
  @HiveField(93)
  int? sipB86Findings;
  @HiveField(94)
  String? sipB86Initials;
  @HiveField(95)
  int? sipB9Findings;
  @HiveField(96)
  String? sipB9Initials;
  @HiveField(97)
  int? sipB91Findings;
  @HiveField(98)
  String? sipB91Initials;
  @HiveField(99)
  int? sipB92Findings;
  @HiveField(100)
  String? sipB92Initials;

  ScheduledInspection({
    required this.sipA1Findings,
    required this.sipA1Initials,
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
    required this.sipB2Findings,
    required this.sipB2Initials,
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
    required this.sipB3Findings,
    required this.sipB3Initials,
    required this.sipB31Findings,
    required this.sipB31Initials,
    required this.sipB32Findings,
    required this.sipB32Initials,
    required this.sipB4Findings,
    required this.sipB4Initials,
    required this.sipB41Findings,
    required this.sipB41Initials,
    required this.sipB42Findings,
    required this.sipB42Initials,
    required this.sipB43Findings,
    required this.sipB43Initials,
    required this.sipB44Findings,
    required this.sipB44Initials,
    required this.sipB5Findings,
    required this.sipB5Initials,
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
    required this.sipB6Findings,
    required this.sipB6Initials,
    required this.sipB61Findings,
    required this.sipB61Initials,
    required this.sipB62Findings,
    required this.sipB62Initials,
    required this.sipB63Findings,
    required this.sipB63Initials,
    required this.sipB64Findings,
    required this.sip64Initials,
    required this.sipB7Findings,
    required this.sipB7Initials,
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
    required this.sipB8Findings,
    required this.sipB8Initials,
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
    required this.sipB9Findings,
    required this.sipB9Initials,
    required this.sipB91Findings,
    required this.sipB91Initials,
    required this.sipB92Findings,
    required this.sipB92Initials,
  });
}
