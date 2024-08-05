import 'package:drive_check_admin/New%20Code/View/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/User Center/user_center.dart';

class HomepageController extends GetxController{

  RxInt selectedPage = 0.obs;
  RxList screens = <Widget>[
    Home(),
    UserCenter(),
    Home(),
  ].obs;

}