import 'package:drive_check_admin/New%20Code/Components/sidebar_item.dart';
import 'package:drive_check_admin/New%20Code/Controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/colors.dart';
import '../Helper/utils.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final HomepageController controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: SvgPicture.asset(Utils.instaLogo, width: 60,),
            title: Text("DriveCheck", style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            ),
            subtitle: Text("by Insta ICT Solutions", style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w100
            ),),
            contentPadding: EdgeInsets.all(0),
          ),
          Divider(
            color: CustomColors.adColor,
          ),
          SizedBox(
            height: 70,
          ),
          Obx(()=>SidebarItem(isSelected: controller.selectedPage.value == 0, onTap: (){controller.selectedPage.value = 0;}, icon: Utils.homeIcon, title: "Home"),),
          Obx(()=>SidebarItem(isSelected: controller.selectedPage.value == 1, onTap: (){controller.selectedPage.value = 1;}, icon: Utils.userIcon, title: "User Center"),),
          Obx(()=>SidebarItem(isSelected: controller.selectedPage.value == 2, onTap: (){controller.selectedPage.value = 2;}, icon: Utils.safeIcon, title: "OHS Verification"),),
          Obx(()=>SidebarItem(isSelected: controller.selectedPage.value == 3, onTap: (){controller.selectedPage.value = 3;}, icon: Utils.empSettingIcon, title: "Employee Settings"),),
        ],
      ),
    );
  }
}
