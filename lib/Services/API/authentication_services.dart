// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/Local/user_model.dart';
import 'package:henawi_limited/providers.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices with ChangeNotifier {
  UserModel? _currentUserModel;
  UserModel? get currentUserModel => _currentUserModel;

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  void setAdminLoginFeature() {
    _isAdmin = !_isAdmin;
    notifyListeners();
  }

  Future<int> loginUsingEmail(String EMAIL, String PASSWORD) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('StaffAuth').authWithPassword(EMAIL, PASSWORD);
      final userData = await pb.collection('StaffAuth').getList(filter: 'email = "$EMAIL"');
      if (userData.items.last.data['Privilege_Level'] != 0 ||
          userData.items.last.data['Privilege_Level'] != null) {
        DateTime dateTime = DateTime.parse(userData.items.last.data['Insurance_Validity']);
        DateFormat dateFormat = DateFormat("dd MMMM yyyy");
        String formattedDate = dateFormat.format(dateTime);

        _currentUserModel = UserModel(
            userID: userData.items.last.id,
            userName: userData.items.last.data['Name'],
            phone: userData.items.last.data['Phone'],
            userEmail: userData.items.last.data['email'],
            gender: userData.items.last.data['Gender'],
            position: userData.items.last.data['Position'],
            marital: userData.items.last.data['Marital_Status'],
            insuranceAgent: userData.items.last.data['Insurance_Agent'],
            insuranceClass: userData.items.last.data['Insurance_Class'],
            insuranceValidity: formattedDate,
            privilegeLevel: userData.items.last.data['Privilege_Level'],
            age: userData.items.last.data['Age'],
            salary: userData.items.last.data['Salary'],
            nationality: userData.items.last.data['Nationality'],
            idType: userData.items.last.data['ID_Type'],
            idNumber: userData.items.last.data['ID_Number'],
            status: userData.items.last.data['Status'].toString(),
            profileImage: userData.items.last.data['Profile_Image']);

        notifyListeners();
      }
      return 200;
    } on ClientException catch (e) {
      return e.statusCode;
    }
  }

  Future<int> adminLoginUsingEmail(String EMAIL, String PASSWORD) async {
    final prefs = await SharedPreferences.getInstance();
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.admins.authWithPassword(EMAIL, PASSWORD);
      prefs.setString('bypassE', EMAIL);
      prefs.setString('bypassP', PASSWORD);
      notifyListeners();
      return 200;
    } on ClientException catch (e) {
      notifyListeners();
      return e.statusCode;
    }
  }

  Future sendVerificationEmail() async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    await pb.collection('StaffAuth').requestVerification('eldoradokid966@hotmail.com');
  }

  void logOut() {
    final pb = PocketBase(DatabaseServices.regularConstant);
    pb.authStore.clear();
  }
}
