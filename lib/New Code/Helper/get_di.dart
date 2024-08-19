import "package:drive_check_admin/New%20Code/Controller/homepage_controller.dart";
import "package:drive_check_admin/New%20Code/Controller/ohs_controller.dart";
import "package:drive_check_admin/New%20Code/Controller/user_controller.dart";
import "package:get/get.dart";
import "../Controller/auth_controller.dart";

Future<void> init() async{
  Get.lazyPut(()=>AuthController());
  Get.lazyPut(()=>HomepageController());
  Get.lazyPut(()=>UserController());
  Get.lazyPut(()=>OhsController());
}