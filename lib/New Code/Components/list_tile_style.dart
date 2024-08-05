import 'package:drive_check_admin/New%20Code/Components/navbar_container.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final Widget child;

  CustomTile({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(250, 70),
          painter: NavbarContainer(),
        ),
        Container(
          alignment: Alignment.center,
          child: child,
        ),
      ],
    );
  }
}
