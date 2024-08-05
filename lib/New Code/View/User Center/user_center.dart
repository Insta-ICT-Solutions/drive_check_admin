import 'package:drive_check_admin/New%20Code/View/User%20Center/user_center_mobile.dart';
import 'package:drive_check_admin/New%20Code/View/User%20Center/user_center_web.dart';
import 'package:flutter/material.dart';
import '../../../screens/Responsiveness/responsive.dart';

class UserCenter extends StatelessWidget {
  const UserCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: UserCenterWeb(),
      mobile: UserCenterMobile(),
      desktop: UserCenterWeb(),
    );
  }
}

