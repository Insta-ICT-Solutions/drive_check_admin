import 'package:drive_check_admin/New%20Code/View/Login/login_web.dart';
import 'package:flutter/material.dart';
import '../../../screens/Responsiveness/responsive.dart';
import 'login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: LoginWeb(),
      mobile: LoginMobile(),
      desktop: LoginWeb(),
    );
  }
}
