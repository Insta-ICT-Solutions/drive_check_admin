import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/user_controller.dart';
import '../../Model/user_data_source.dart';

class UserCenterWeb extends StatelessWidget {
  const UserCenterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomSearchbar(
          //   controller: controller.searchController,
          //   onChanged: controller.filterUsers,
          // ),
          SizedBox(height: 25.0),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.filteredUsers.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.warning, size: 100, color: Colors.grey),
                      Text(
                        "Oops! Nothing found",
                        style: GoogleFonts.poppins(fontSize: 24, color: Colors.blue),
                      ),
                    ],
                  ),
                );
              } else {
                final dataSource = UserDataSource(controller.filteredUsers);
                return ListView(
                  children: [
                    Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      interactive: true,
                      thickness: 10,
                      child: PaginatedDataTable(
                        headingRowColor: WidgetStatePropertyAll(
                          Colors.greenAccent.withOpacity(0.25),
                        ),
                        primary: true,
                        columns: [
                          DataColumn(label: Text('Employee Name')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Phone Number')),
                          DataColumn(label: Text('Employee ID')),
                          DataColumn(label: Text('Availability')),
                          DataColumn(label: Text('State')),
                          DataColumn(label: Text('Profile Picture')),
                        ],
                        source: dataSource,
                        rowsPerPage: 10,
                        columnSpacing: 25,
                        horizontalMargin: 20,
                      ),
                    ),
                    if (controller.isLoading.value)
                      Center(child: CircularProgressIndicator()),
                  ],
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}