import 'package:hive/hive.dart';
part 'instructor_model.g.dart';

@HiveType(typeId: 0)
class Instructor extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  late String? name;
  @HiveField(2)
  late String? lastName;
  @HiveField(3)
  late String? middleName;
  @HiveField(4)
  late String? accountID;
  @HiveField(5)
  late String? department;
  @HiveField(6)
  late String? userName;
  @HiveField(7)
  late String? password;
  Instructor({
    required this.name,
    required this.lastName,
    required this.middleName,
    required this.accountID,
    required this.department,
    required this.userName,
    required this.password,
  });
}
