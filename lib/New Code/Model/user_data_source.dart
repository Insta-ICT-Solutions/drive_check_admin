import 'package:drive_check_admin/New%20Code/Model/user.dart';
import 'package:flutter/material.dart';

class UserDataSource extends DataTableSource {
  final List<User> users;

  UserDataSource(this.users);

  @override
  DataRow? getRow(int index) {
    if (index >= users.length) return null;
    final user = users[index];
    return DataRow(
        cells: [
      DataCell(Text(user.employeeName, overflow: TextOverflow.ellipsis)),
      DataCell(Text(user.email, overflow: TextOverflow.ellipsis)),
      DataCell(Text(user.phoneNumber, overflow: TextOverflow.ellipsis)),
      DataCell(Text(user.employeeId, overflow: TextOverflow.ellipsis)),
      DataCell(Text(user.availability, overflow: TextOverflow.ellipsis)),
      DataCell(Text(user.state ?? '', overflow: TextOverflow.ellipsis)),
      DataCell(user.profilePicture != null
          ? Image.network(user.profilePicture!, fit: BoxFit.cover)
          : Text('No picture', overflow: TextOverflow.ellipsis)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
