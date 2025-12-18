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
  late TextEditingController _passportNumberController;
  late TextEditingController _startDateController;
  late TextEditingController _birthDateController;
  late TextEditingController _firstDoseDateController;
  late TextEditingController _secondDoseDateController;
  late bool _status;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    _userNameController = TextEditingController(text: Data.userName);
    _passportNumberController = TextEditingController(
      text: Data.passportNumber,
    );
    _startDateController = TextEditingController(text: Data.startDate);
    _birthDateController = TextEditingController(text: Data.birthDate);
    _firstDoseDateController = TextEditingController(text: Data.firstDoseDate);
    _secondDoseDateController = TextEditingController(
      text: Data.secondDoseDate,
    );
    _status = Data.status;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passportNumberController.dispose();
    _startDateController.dispose();
    _birthDateController.dispose();
    _firstDoseDateController.dispose();
    _secondDoseDateController.dispose();
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
                                      ? const Color(
                                          0xFF1B5E20,
                                        ).withValues(alpha: 0.5)
                                      : Colors.grey.withValues(alpha: 0.3),
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
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
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
