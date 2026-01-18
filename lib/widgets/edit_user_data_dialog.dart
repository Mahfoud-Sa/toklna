import 'package:flutter/material.dart';
import 'package:toklna/data.dart';

/// A dialog for editing user data.
class EditUserDataDialog extends StatefulWidget {
  const EditUserDataDialog({super.key});

  @override
  State<EditUserDataDialog> createState() => _EditUserDataDialogState();

  /// Show the edit user data dialog.
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const EditUserDataDialog(),
    );
  }
}

class _EditUserDataDialogState extends State<EditUserDataDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _userNameController;
  late TextEditingController _userNameEnController;
  late TextEditingController _passportNumberController;
  late TextEditingController _startDateController;
  late TextEditingController _birthDateController;
  late TextEditingController _firstDoseDateController;
  late TextEditingController _secondDoseDateController;
  late TextEditingController _workOwnerNameController;
  late TextEditingController _workOwnerNameEnController;
  late TextEditingController _nationalityController;
  late TextEditingController _nationalityEnController;
  late TextEditingController _issuePlaceController;
  late TextEditingController _issuePlaceEnController;
  late TextEditingController _professionController;
  late TextEditingController _professionEnController;
  late TextEditingController _religionController;
  late TextEditingController _religionEnController;
  late bool _status;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    _userNameController = TextEditingController(text: Data.userName);
    _userNameEnController = TextEditingController(text: Data.userNameEn);
    _passportNumberController = TextEditingController(
      text: Data.passportNumber,
    );
    _startDateController = TextEditingController(text: Data.startDate);
    _birthDateController = TextEditingController(text: Data.birthDate);
    _firstDoseDateController = TextEditingController(text: Data.firstDoseDate);
    _secondDoseDateController = TextEditingController(
      text: Data.secondDoseDate,
    );
    _workOwnerNameController = TextEditingController(text: Data.workOwnerName);
    _workOwnerNameEnController = TextEditingController(
      text: Data.workOwnerNameEn,
    );
    _nationalityController = TextEditingController(text: Data.nationality);
    _nationalityEnController = TextEditingController(text: Data.nationalityEn);
    _issuePlaceController = TextEditingController(text: Data.issuePlace);
    _issuePlaceEnController = TextEditingController(text: Data.issuePlaceEn);
    _professionController = TextEditingController(text: Data.profession);
    _professionEnController = TextEditingController(text: Data.professionEn);
    _religionController = TextEditingController(text: Data.religion);
    _religionEnController = TextEditingController(text: Data.religionEn);
    _status = Data.status;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userNameEnController.dispose();
    _passportNumberController.dispose();
    _startDateController.dispose();
    _birthDateController.dispose();
    _firstDoseDateController.dispose();
    _secondDoseDateController.dispose();
    _workOwnerNameController.dispose();
    _workOwnerNameEnController.dispose();
    _nationalityController.dispose();
    _nationalityEnController.dispose();
    _issuePlaceController.dispose();
    _issuePlaceEnController.dispose();
    _professionController.dispose();
    _professionEnController.dispose();
    _religionController.dispose();
    _religionEnController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await Data.saveData(
        userName: _userNameController.text,
        personalImage: Data.personalImage, // Keep current value
        passportNumber: _passportNumberController.text,
        status: _status,
        startDate: _startDateController.text,
        birthDate: _birthDateController.text,
        firstDoseDate: _firstDoseDateController.text,
        secondDoseDate: _secondDoseDateController.text,
        workOwnerName: _workOwnerNameController.text,
        userNameEn: _userNameEnController.text,
        workOwnerNameEn: _workOwnerNameEnController.text,
        nationality: _nationalityController.text,
        nationalityEn: _nationalityEnController.text,
        issuePlace: _issuePlaceController.text,
        issuePlaceEn: _issuePlaceEnController.text,
        profession: _professionController.text,
        professionEn: _professionEnController.text,
        religion: _religionController.text,
        religionEn: _religionEnController.text,
      );

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حفظ البيانات بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في حفظ البيانات: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1B5E20),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const Text(
                  'تعديل البيانات الشخصية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Form
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTextField(
                          controller: _userNameController,
                          label: 'الاسم',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _userNameEnController,
                          label: 'Name (English)',
                          icon: Icons.person_outline,
                          isRtl: false,
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _passportNumberController,
                          label: 'رقم الهوية',
                          icon: Icons.badge,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),

                        // Status Switch
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.health_and_safety,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'الحالة الصحية (محصّن)',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Switch.adaptive(
                                value: _status,
                                onChanged: (value) =>
                                    setState(() => _status = value),
                                thumbColor: WidgetStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(WidgetState.selected)
                                      ? const Color(0xFF1B5E20)
                                      : Colors.grey,
                                ),
                                trackColor: WidgetStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(WidgetState.selected)
                                      ? const Color(0xFF1B5E20).withOpacity(0.5)
                                      : Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _startDateController,
                          label: 'تاريخ البداية',
                          icon: Icons.calendar_today,
                          hint: 'مثال: 1442/03/15',
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _birthDateController,
                          label: 'تاريخ الميلاد',
                          icon: Icons.cake,
                          hint: 'مثال: 2007/07/03',
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _firstDoseDateController,
                          label: 'تاريخ الجرعة الأولى',
                          icon: Icons.vaccines,
                          hint: 'مثال: 2021/06/13',
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _secondDoseDateController,
                          label: 'تاريخ الجرعة الثانية',
                          icon: Icons.vaccines_outlined,
                          hint: 'مثال: 2021/10/17',
                        ),
                        const SizedBox(height: 16),

                        _buildTextField(
                          controller: _workOwnerNameController,
                          label: 'صاحب العمل',
                          icon: Icons.business,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _workOwnerNameEnController,
                          label: 'Employer (English)',
                          icon: Icons.business_outlined,
                          isRtl: false,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _nationalityController,
                          label: 'الجنسية',
                          icon: Icons.flag,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _nationalityEnController,
                          label: 'Nationality (English)',
                          icon: Icons.flag_outlined,
                          isRtl: false,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _issuePlaceController,
                          label: 'مكان الإصدار',
                          icon: Icons.location_on,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _issuePlaceEnController,
                          label: 'Issue Place (English)',
                          icon: Icons.location_on_outlined,
                          isRtl: false,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _professionController,
                          label: 'المهنة',
                          icon: Icons.work,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _professionEnController,
                          label: 'Profession (English)',
                          icon: Icons.work_outline,
                          isRtl: false,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _religionController,
                          label: 'الديانة',
                          icon: Icons.security,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _religionEnController,
                          label: 'Religion (English)',
                          icon: Icons.security_outlined,
                          isRtl: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Buttons
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200]!)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: _isSaving
                            ? null
                            : () => Navigator.of(context).pop(false),
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _saveData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B5E20),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('حفظ'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    bool isRtl = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelAlignment: isRtl
            ? FloatingLabelAlignment.start
            : FloatingLabelAlignment.start,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF1B5E20), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }
}
