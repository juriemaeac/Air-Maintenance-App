import 'package:hive/hive.dart';
//part 'maintenanceTask_model.dart';

@HiveType(typeId: 3)
class MaintenanceTask extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? accountID;
  @HiveField(2)
  String? taskCardNumber;
  @HiveField(3)
  String? taskCardSpecification;
  @HiveField(4)
  String? taskCardRevision;
  @HiveField(5)
  String? taskCardRevisionDate;
  @HiveField(6)
  String? woSpecification;
  @HiveField(7)
  String? woScheduleStart;
  @HiveField(8)
  String? location;
  @HiveField(9)
  String? aircraftType;
  @HiveField(10)
  String? acReg;
  @HiveField(11)
  String? acSerial;
  @HiveField(12)
  String? area;
  @HiveField(13)
  String? student;
  @HiveField(14)
  String? instructor;
  @HiveField(15)
  String? taskCardType;
  @HiveField(16)
  String? ata;
  @HiveField(17)
  String? mmEffectivity;
  @HiveField(18)
  String? ipcEffectivity;
  @HiveField(19)
  String? manHours;
  @HiveField(20)
  String? men;
  @HiveField(21)
  String? user;
  @HiveField(22)
  String? acRegA;
  @HiveField(23)
  String? userA;
  @HiveField(24)
  String? dateA;
  //===================================================================
  @HiveField(25)
  String? itemNum;
  @HiveField(26)
  String? userActionDescription;
  @HiveField(27)
  String? studentB;
  @HiveField(28)
  String? instructorB;
  @HiveField(29)
  String? inspectorB;
  @HiveField(30)
  String? submittedBy;
  @HiveField(31)
  String? reviewedBy;
  @HiveField(32)
  String? completedBy;
  @HiveField(33)
  String? dateCompletionB;
  @HiveField(34)
  String? departmentB;
  @HiveField(35)
  String? acRegB;
  @HiveField(35)
  String? userB;
  @HiveField(36)
  String? dateB;
  //Walkaround fuselage wings and tails
  @HiveField(37)
  String? findingsA1;
  @HiveField(38)
  String? findingsB1;
  @HiveField(39)
  String? findingsLogbook1;
  @HiveField(40)
  String? findingsSolution1;
  @HiveField(41)
  String? findingsResult1;
  //Walkaround exterior
  @HiveField(42)
  String? findingsA2;
  @HiveField(43)
  String? findingsB2;
  @HiveField(44)
  String? findingsLogbook2;
  @HiveField(45)
  String? findingsSolution2;
  @HiveField(46)
  String? findingsResult2;
  //Check Engine
  @HiveField(47)
  String? findingsA3;
  @HiveField(48)
  String? findingsB3;
  @HiveField(49)
  String? findingsLogbook3;
  @HiveField(50)
  String? findingsSolution3;
  @HiveField(51)
  String? findingsResult3;
  //Check Visual inspection battery alternator
  @HiveField(52)
  String? findingsA4;
  @HiveField(53)
  String? findingsB4;
  @HiveField(54)
  String? findingsLogbook4;
  @HiveField(55)
  String? findingsSolution4;
  @HiveField(56)
  String? findingsResult4;
  //Check Lighting System
  @HiveField(57)
  String? findingsA5;
  @HiveField(58)
  String? findingsB5;
  @HiveField(59)
  String? findingsLogbook5;
  @HiveField(60)
  String? findingsSolution5;
  @HiveField(61)
  String? findingsResult5;
  //Check Flashing Beacon
  @HiveField(62)
  String? findingsA6;
  @HiveField(63)
  String? findingsB6;
  @HiveField(63)
  String? findingsLogbook6;
  @HiveField(64)
  String? findingsSolution6;
  @HiveField(65)
  String? findingsResult6;

  MaintenanceTask(
      {required this.id,
      required this.accountID,
      required this.taskCardNumber,
      required this.taskCardSpecification,
      required this.taskCardRevision,
      required this.taskCardRevisionDate,
      required this.woSpecification,
      required this.woScheduleStart,
      required this.location,
      required this.aircraftType,
      required this.acReg,
      required this.acSerial,
      required this.area,
      required this.student,
      required this.instructor,
      required this.taskCardType,
      required this.ata,
      required this.mmEffectivity,
      required this.ipcEffectivity,
      required this.manHours,
      required this.men,
      required this.user,
      required this.acRegA,
      required this.userA,
      required this.dateA,
      required this.itemNum,
      required this.userActionDescription,
      required this.studentB,
      required this.instructorB,
      required this.inspectorB,
      required this.submittedBy,
      required this.reviewedBy,
      required this.completedBy,
      required this.dateCompletionB,
      required this.departmentB,
      required this.acRegB,
      required this.userB,
      required this.dateB,
      required this.findingsA1,
      required this.findingsB1,
      required this.findingsLogbook1,
      required this.findingsSolution1,
      required this.findingsResult1,
      required this.findingsA2,
      required this.findingsB2,
      required this.findingsLogbook2,
      required this.findingsSolution2,
      required this.findingsResult2,
      required this.findingsA3,
      required this.findingsB3,
      required this.findingsLogbook3,
      required this.findingsSolution3,
      required this.findingsResult3,
      required this.findingsA4,
      required this.findingsB4,
      required this.findingsLogbook4,
      required this.findingsSolution4,
      required this.findingsResult4,
      required this.findingsA5,
      required this.findingsB5,
      required this.findingsLogbook5,
      required this.findingsSolution5,
      required this.findingsResult5,
      required this.findingsA6,
      required this.findingsB6,
      required this.findingsLogbook6,
      required this.findingsSolution6,
      required this.findingsResult6});
}
