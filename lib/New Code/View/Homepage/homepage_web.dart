import 'package:drive_check_admin/New%20Code/Components/side_bar.dart';
import 'package:drive_check_admin/New%20Code/Controller/homepage_controller.dart';
import 'package:drive_check_admin/New%20Code/Helper/colors.dart';
import 'package:drive_check_admin/New%20Code/Helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageWeb extends StatelessWidget {
  HomepageWeb({super.key});

  final HomepageController controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF348F6C),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sidebar(),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: Obx(()=>controller.screens[controller.selectedPage.value]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
