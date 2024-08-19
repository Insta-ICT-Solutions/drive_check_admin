import 'package:drive_check_admin/New%20Code/View/OHS/ohs_mobile.dart';
import 'package:drive_check_admin/New%20Code/View/OHS/ohs_web.dart';
import 'package:flutter/material.dart';
import '../../../screens/Responsiveness/responsive.dart';

class OhsScreen extends StatelessWidget {
  const OhsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: OhsWeb(),
      mobile: OhsMobile(),
      desktop: OhsWeb(),
    );
  }
}