import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/fetched_data_card.dart';
import '../../Controller/ohs_controller.dart';

class OhsWeb extends StatelessWidget {
  OhsWeb({super.key});

  final OhsController controller = Get.find<OhsController>();
  final TextEditingController siteIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSelectionRow(context),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.siteId.value = siteIDController.text.trim();
                  controller.fetchData(controller.siteId.value);
                },
                child: Text('Fetch Data'),
              ),
              SizedBox(height: 20),
              Obx(() {
                if (controller.fetchedData.isEmpty) {
                  return Text('No data available');
                } else {
                  return FetchedDataCard(
                    data: Map<String, dynamic>.from(controller.fetchedData),
                    title: 'Fetched Data',
                  );
                }
              }),
            ],
          ),
        ),
    );
  }

  Widget _buildSelectionRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => _buildDropdown(
          label: 'Select Employee',
          value: controller.selectedEmployee.value,
          items: controller.employeeNames,
          onChanged: (value) => controller.selectedEmployee.value = value!,
        )),
        SizedBox(width: 20),
        Expanded(
          child: _buildTextField(
            controller: siteIDController,
            labelText: 'Enter Site ID',
          ),
        ),
        SizedBox(width: 20),
        _buildDropdown(
          label: 'Select Type',
          value: controller.selectedType.value,
          items: ['Activity Type', 'PreSiteData', 'OnSiteData', 'PostSiteData'],
          onChanged: (value) => controller.selectedType.value = value!,
        ),
        SizedBox(width: 20),
        Obx(() => ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text(
            controller.selectedDate.value.toLocal().toString().split(' ')[0],
          ),
        )),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      children: [
        Text('$label:'),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            underline: Container(),
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != controller.selectedDate.value) {
      controller.selectedDate.value = pickedDate;
    }
  }
}
