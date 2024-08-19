import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String availability;
  final String email;
  final String employeeId;
  final String employeeName;
  final String phoneNumber;
  final String? profilePicture;
  final String? reason;
  final String? taskId;
  final String? state;

  User({
    required this.uid,
    required this.availability,
    required this.email,
    required this.employeeId,
    required this.employeeName,
    required this.phoneNumber,
    this.profilePicture,
    this.reason,
    this.taskId,
    this.state,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      availability: data['Availability'] ?? '',
      email: data['Email'] ?? '',
      employeeId: data['Employee ID'] ?? '',
      employeeName: data['Employee Name'] ?? '',
      phoneNumber: data['Phone Number'] ?? '',
      profilePicture: data['Profile Picture'],
      reason: data['Reason'],
      taskId: data['taskID'],
      state: data['state'],
    );
  }
}