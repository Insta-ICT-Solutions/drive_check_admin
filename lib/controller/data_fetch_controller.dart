import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OHSCheckController extends GetxController {
  var selectedEmployee = 'Select Employee'.obs;
  var selectedType = 'Activity Type'.obs;
  var selectedDate = DateTime.now().obs;
  var fetchedData = <String, dynamic>{}.obs;
  var siteId = ''.obs;
  var siteDate = ''.obs;
  var state = 'preSite'.obs;
  var rejectedState = 'preSite'.obs;

  Future<void> fetchData(String siteID) async {
    switch(selectedType.value){
      case 'PreSiteData':
        state.value = 'onSite';
        break;

      case 'OnSiteData':
        state.value = 'postSite';
        break;

      case 'PostSiteData':
        state.value = 'completed';
        break;

      default:
        state.value = 'preSite';
    }

    if (selectedEmployee.value == 'Select Employee' || selectedType.value == 'Activity Type') {
      showSnackbar('Error', 'Please select both employee and type');
      return;
    }

    switch(selectedType.value){
      case 'PreSiteData':
        rejectedState.value = 'preSite';
        break;

      case 'OnSiteData':
        rejectedState.value = 'onSite';
        break;

      case 'PostSiteData':
        rejectedState.value = 'postSite';
        break;

      default:
        rejectedState.value = 'preSite';
    }

    if (selectedEmployee.value == 'Select Employee' || selectedType.value == 'Activity Type') {
      showSnackbar('Error', 'Please select both employee and type');
      return;
    }

    String formattedDate = '${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}';
    siteDate.value = '${selectedDate.value.day}-${selectedDate.value.month.toString()}-${selectedDate.value.year}';

    try {
      DocumentSnapshot dataSnapshot = await FirebaseFirestore.instance
          .collection('siteAllocation')
          .doc(siteID+"(${siteDate})")
          .collection(selectedType.value)
          .doc(formattedDate)
          .get();

      if (dataSnapshot.exists) {
        var data = dataSnapshot.data() as Map<String, dynamic>? ?? {};
        data['Employee Name'] = selectedEmployee.value;
        fetchedData.value = data;
      } else {
        fetchedData.value = {};
        showSnackbar('Error', 'No data found for the selected date and type');
      }
    } catch (e) {
      fetchedData.value = {};
      showSnackbar('Error', 'Error fetching data: $e');
    }
  }


  void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}
