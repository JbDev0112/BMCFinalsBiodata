import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final birthController = TextEditingController();
  final placeBirthController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final currentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final citizenshipController = TextEditingController();
  final nationalityController = TextEditingController();
  final civilStatusController = TextEditingController();

  final motherNameController = TextEditingController();
  final motherOccupationController = TextEditingController();
  final fatherNameController = TextEditingController();
  final fatherOccupationController = TextEditingController();

  final elementarySchoolController = TextEditingController();
  final elementaryGraduateController = TextEditingController();
  final highSchoolController = TextEditingController();
  final highSchoolGraduateController = TextEditingController();
  final collegeSchoolController = TextEditingController();
  final collegeGraduateController = TextEditingController();

  String output = '';

  InputDecoration inputDesign(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(),
    );
  }

  Widget field({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool requiredField = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter $label';
              }
              return null;
            }
          : null,
      decoration: inputDesign(label, icon),
    );
  }

  Widget twoFields(Widget first, Widget second) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 650) {
          return Column(children: [first, const SizedBox(height: 16), second]);
        }

        return Row(
          children: [
            Expanded(child: first),
            const SizedBox(width: 16),
            Expanded(child: second),
          ],
        );
      },
    );
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      output =
          '''
PERSONAL INFORMATION

Name: ${nameController.text.trim()}
Mobile Number: ${mobileController.text.trim()}
Email Address: ${emailController.text.trim()}
Date of Birth: ${birthController.text.trim()}
Place of Birth: ${placeBirthController.text.trim()}
Age: ${ageController.text.trim()}
Gender: ${genderController.text.trim()}
Current Address: ${currentAddressController.text.trim()}
Permanent Address: ${permanentAddressController.text.trim()}
Citizenship: ${citizenshipController.text.trim()}
Nationality: ${nationalityController.text.trim()}
Civil Status: ${civilStatusController.text.trim()}

PARENT INFORMATION

Mother Name: ${motherNameController.text.trim()}
Mother Occupation: ${motherOccupationController.text.trim()}
Father Name: ${fatherNameController.text.trim()}
Father Occupation: ${fatherOccupationController.text.trim()}

EDUCATIONAL BACKGROUND

Elementary School: ${elementarySchoolController.text.trim()}
Elementary Graduate Date: ${elementaryGraduateController.text.trim()}
High School: ${highSchoolController.text.trim()}
High School Graduate Date: ${highSchoolGraduateController.text.trim()}
College School: ${collegeSchoolController.text.trim()}
College Graduate Date: ${collegeGraduateController.text.trim()}
''';
    });
  }

  void clearForm() {
    for (final controller in [
      nameController,
      mobileController,
      emailController,
      birthController,
      placeBirthController,
      ageController,
      genderController,
      currentAddressController,
      permanentAddressController,
      citizenshipController,
      nationalityController,
      civilStatusController,
      motherNameController,
      motherOccupationController,
      fatherNameController,
      fatherOccupationController,
      elementarySchoolController,
      elementaryGraduateController,
      highSchoolController,
      highSchoolGraduateController,
      collegeSchoolController,
      collegeGraduateController,
    ]) {
      controller.clear();
    }

    setState(() {
      output = '';
    });
  }

  @override
  void dispose() {
    for (final controller in [
      nameController,
      mobileController,
      emailController,
      birthController,
      placeBirthController,
      ageController,
      genderController,
      currentAddressController,
      permanentAddressController,
      citizenshipController,
      nationalityController,
      civilStatusController,
      motherNameController,
      motherOccupationController,
      fatherNameController,
      fatherOccupationController,
      elementarySchoolController,
      elementaryGraduateController,
      highSchoolController,
      highSchoolGraduateController,
      collegeSchoolController,
      collegeGraduateController,
    ]) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Bio Data Form'),
        backgroundColor: const Color(0xFF4A76C5),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 950),
            child: Form(
              key: _formKey,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A76C5),
                        ),
                      ),
                      const SizedBox(height: 20),

                      twoFields(
                        field(
                          controller: nameController,
                          label: 'Name',
                          icon: Icons.person,
                          requiredField: true,
                        ),
                        field(
                          controller: mobileController,
                          label: 'Mobile Number',
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          requiredField: true,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: emailController,
                          label: 'Email Address',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          requiredField: true,
                        ),
                        field(
                          controller: birthController,
                          label: 'Date of Birth',
                          icon: Icons.cake,
                          requiredField: true,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: placeBirthController,
                          label: 'Place of Birth',
                          icon: Icons.location_city,
                        ),
                        field(
                          controller: ageController,
                          label: 'Age',
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: genderController,
                          label: 'Gender',
                          icon: Icons.wc,
                        ),
                        field(
                          controller: currentAddressController,
                          label: 'Current Address',
                          icon: Icons.home,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: permanentAddressController,
                          label: 'Permanent Address',
                          icon: Icons.home_work,
                        ),
                        field(
                          controller: citizenshipController,
                          label: 'Citizenship',
                          icon: Icons.person_outline,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: nationalityController,
                          label: 'Nationality',
                          icon: Icons.flag,
                        ),
                        field(
                          controller: civilStatusController,
                          label: 'Civil Status',
                          icon: Icons.people,
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 16),

                      const Text(
                        'Parent Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A76C5),
                        ),
                      ),
                      const SizedBox(height: 20),

                      twoFields(
                        field(
                          controller: motherNameController,
                          label: 'Mother Name',
                          icon: Icons.person,
                        ),
                        field(
                          controller: motherOccupationController,
                          label: 'Mother Occupation',
                          icon: Icons.work,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: fatherNameController,
                          label: 'Father Name',
                          icon: Icons.person,
                        ),
                        field(
                          controller: fatherOccupationController,
                          label: 'Father Occupation',
                          icon: Icons.work,
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 16),

                      const Text(
                        'Educational Background',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A76C5),
                        ),
                      ),
                      const SizedBox(height: 20),

                      twoFields(
                        field(
                          controller: elementarySchoolController,
                          label: 'Elementary School Name',
                          icon: Icons.school,
                        ),
                        field(
                          controller: elementaryGraduateController,
                          label: 'Elementary Graduate Date',
                          icon: Icons.date_range,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: highSchoolController,
                          label: 'High School Name',
                          icon: Icons.school,
                        ),
                        field(
                          controller: highSchoolGraduateController,
                          label: 'High School Graduate Date',
                          icon: Icons.date_range,
                        ),
                      ),
                      const SizedBox(height: 16),

                      twoFields(
                        field(
                          controller: collegeSchoolController,
                          label: 'College School Name',
                          icon: Icons.school,
                        ),
                        field(
                          controller: collegeGraduateController,
                          label: 'College Graduate Date',
                          icon: Icons.date_range,
                        ),
                      ),

                      const SizedBox(height: 30),

                      ElevatedButton.icon(
                        onPressed: submitForm,
                        icon: const Icon(Icons.check),
                        label: const Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A76C5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 12),

                      OutlinedButton.icon(
                        onPressed: clearForm,
                        icon: const Icon(Icons.clear),
                        label: const Text('Clear Form'),
                      ),

                      const SizedBox(height: 28),
                      const Divider(),
                      const SizedBox(height: 16),

                      const Text(
                        'OUTPUT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF4A76C5),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SelectableText(
                          output.isEmpty
                              ? 'Your submitted information will appear here.'
                              : output,
                          style: const TextStyle(fontSize: 14, height: 1.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
