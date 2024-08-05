import 'package:flutter/material.dart';
import '../../../screens/Responsiveness/responsive.dart';
import 'home_mobile.dart';
import 'home_web.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: HomeWeb(),
      mobile: HomeMobile(),
      desktop: HomeWeb(),
    );
  }
}

