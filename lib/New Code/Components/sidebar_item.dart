import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Helper/colors.dart';

class SidebarItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  
  const SidebarItem({super.key, required this.isSelected, required this.onTap, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: ListTile(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        leading: SvgPicture.asset(icon, color: isSelected ? CustomColors.backgroundColor : CustomColors.elementColor, width: 24, ),
        title: Text(title, style: GoogleFonts.poppins(fontSize: 16, color: isSelected ? CustomColors.backgroundColor : Colors.white),),
      ),
    );
  }
}
