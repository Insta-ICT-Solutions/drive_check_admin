import 'package:drive_check_admin/New%20Code/Components/login_text_field.dart';
import 'package:drive_check_admin/New%20Code/Components/submit_button.dart';
import 'package:drive_check_admin/New%20Code/Helper/colors.dart';
import 'package:drive_check_admin/New%20Code/Helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/auth_controller.dart';

class LoginWeb extends StatelessWidget {
  LoginWeb({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              alignment: Alignment.center,
              width: 720,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: CustomGradients.loginGradient,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0
                ),
                width: 350,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Utils.instaLogo, height: 80, width: 80,),
                      SizedBox(
                        height: 65,
                      ),
                      Text(
                          "Log in",
                        style: GoogleFonts.poppins(
                          fontSize: 96,
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome back. Now get in here!",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Email Address",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      LoginTextField(hintText: 'user@company.example', controller: authController.emailController, keyBoardType: TextInputType.emailAddress, isPassword: false,),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      LoginTextField(
                        hintText: 'Enter Password', controller: authController.passwordController, keyBoardType: TextInputType.emailAddress, isPassword: true,
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Obx(()=>authController.isLoading.value ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ) : SubmitButton(title: "Log in", onTap: (){
                        authController.isLoading.value = true;
                        authController.login();
                      })
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
              left: 0,
              right: 680,
              top: 0,
              child: SvgPicture.asset(Utils.loginIcon, width: 900,)
          )
        ],
      ),
    );
  }
}
