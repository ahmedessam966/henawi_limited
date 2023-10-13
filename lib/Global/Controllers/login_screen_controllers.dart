import 'package:flutter/material.dart';

class LoginScreenControllers with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passController = TextEditingController();
  TextEditingController get passController => _passController;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void obscureText() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
