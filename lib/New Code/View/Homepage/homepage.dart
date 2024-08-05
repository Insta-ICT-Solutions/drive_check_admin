import 'package:drive_check_admin/New%20Code/View/Homepage/homepage_mobile.dart';
import 'package:drive_check_admin/New%20Code/View/Homepage/homepage_web.dart';
import 'package:flutter/material.dart';
import '../../../screens/Responsiveness/responsive.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: HomepageWeb(),
      mobile: HomepageMobile(),
      desktop: HomepageWeb(),
    );
  }
}

