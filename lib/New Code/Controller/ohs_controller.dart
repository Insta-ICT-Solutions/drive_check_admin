import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OhsController extends GetxController {
  var selectedEmployee = 'Select Employee'.obs;
  var selectedType = 'Activity Type'.obs;
  var selectedDate = DateTime.now().obs;
  var fetchedData = <String, dynamic>{}.obs;
  var siteId = ''.obs;
  var siteDate = ''.obs;
  var state = 'preSite'.obs;
  var rejectedState = 'preSite'.obs;

  // List of employee names
  var employeeNames = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchEmployeeOptions();
  }

  Future<void> fetchData(String siteID) async {
    if (_isSelectionInvalid()) {
      _showSnackbar('Error', 'Please select both employee and type');
      return;
    }

    _updateState();
    _updateSiteDate();

    try {
      final dataSnapshot = await _getDocumentSnapshot(siteID);
      if (dataSnapshot.exists) {
        var data = dataSnapshot.data() as Map<String, dynamic>? ?? {};
        data['Employee Name'] = selectedEmployee.value;
        fetchedData.value = data;
      } else {
        fetchedData.value = {};
        _showSnackbar('Error', 'No data found for the selected date and type');
      }
    } catch (e) {
      fetchedData.value = {};
      _showSnackbar('Error', 'Error fetching data: $e');
    }
  }

  bool _isSelectionInvalid() {
    return selectedEmployee.value == 'Select Employee' || selectedType.value == 'Activity Type';
  }

  void _updateState() {
    final typeToState = {
      'PreSiteData': 'onSite',
      'OnSiteData': 'postSite',
      'PostSiteData': 'completed',
    };
    state.value = typeToState[selectedType.value] ?? 'preSite';
    rejectedState.value = state.value;
  }

  void _updateSiteDate() {
    siteDate.value = '${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}';
  }

  Future<DocumentSnapshot> _getDocumentSnapshot(String siteID) {
    final formattedDate = '${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}';
    return FirebaseFirestore.instance
        .collection('siteAllocation')
        .doc('$siteID(${siteDate.value})')
        .collection(selectedType.value)
        .doc(formattedDate)
        .get();
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }

  // Fetch employee options from Firestore
  Future<void> _fetchEmployeeOptions() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('users').get();
      final List<String> names = ['Select Employee'];

      for (var doc in snapshot.docs) {
        final employeeName = doc.data()['Employee Name'] as String?;
        if (employeeName != null) {
          names.add(employeeName);
        }
      }

      employeeNames.value = names;
    } catch (e) {
      _showSnackbar('Error', 'Error fetching employee options: $e');
    }
  }
}
