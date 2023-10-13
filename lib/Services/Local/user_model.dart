// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String userID;
  final String userName;
  final String phone;
  final String userEmail;
  final String gender;
  final String position;
  final String marital;
  final String insuranceAgent;
  final String insuranceClass;
  final String insuranceValidity;
  final int privilegeLevel;
  final int age;
  final num salary;
  final String nationality;
  final String idType;
  final String idNumber;
  final String status;
  final String? profileImage;

  UserModel({
    this.profileImage,
    required this.userID,
    required this.userName,
    required this.phone,
    required this.userEmail,
    required this.gender,
    required this.position,
    required this.marital,
    required this.insuranceAgent,
    required this.insuranceClass,
    required this.insuranceValidity,
    required this.privilegeLevel,
    required this.age,
    required this.salary,
    required this.nationality,
    required this.idType,
    required this.idNumber,
    required this.status,
  });
}
