// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../Services/Local/user_model.dart';

class StaffModel {
  List<UserModel> users;
  int staffCount;
  StaffModel({
    required this.users,
    required this.staffCount,
  });
}
