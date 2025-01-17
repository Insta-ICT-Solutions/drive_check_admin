import 'package:drive_check_admin/New%20Code/View/Login/login_page.dart';
import 'package:drive_check_admin/screens/Task%20Allocation/task_allocation.dart';
import 'package:drive_check_admin/screens/dashboard.dart';
import 'package:drive_check_admin/screens/Employee%20Setting/employee_settings.dart';
import 'package:drive_check_admin/screens/ohs_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../utils/widget_utils.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  Widget _selectedScreen = Dashboard();
  screenSelector(item){
    switch(item.route){
      case Dashboard.routeName:
        setState(() {
          _selectedScreen = Dashboard();
        });
        break;
      case OHSCheck.routeName:
        setState(() {
          _selectedScreen = OHSCheck();
        });
        break;

      case EmployeeSettings.routeName:
        setState(() {
          _selectedScreen = EmployeeSettings();
        });
        break;

      case TaskAllocation.routeName:
        setState(() {
          _selectedScreen = TaskAllocation();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('DriveCheck Admin panel'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            final FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut().then((_){
              Get.offAll(()=>LoginPage());
            });

          }, icon: Icon(Icons.exit_to_app_rounded))
        ],
      ),
      sideBar: SideBar(
        activeBackgroundColor: Colors.blue.withOpacity(0.4),
        footer: Container(
          color: Colors.grey.shade200,
            height: 60, child: Column(
          children: [
            Text("Contact us"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: WidgetUtils.footerItems,),
          ],
        )),
        textStyle: TextStyle(
          color: Colors.black
        ),
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            route: Dashboard.routeName,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Check OHS',
            icon: Icons.health_and_safety_outlined,
            route: OHSCheck.routeName
          ),
          AdminMenuItem(
            title: 'Employee Settings',
            icon: Icons.settings,
            route: EmployeeSettings.routeName
          ),
          AdminMenuItem(
            title: 'Task Allocation',
            icon: Icons.edit_document,
            route: TaskAllocation.routeName
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          screenSelector(item);
        },
      ),
      body: _selectedScreen
    );
  }
}
