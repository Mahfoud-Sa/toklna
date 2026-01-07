import 'package:flutter/material.dart';
import 'package:toklna/data.dart';

/// A dialog for editing PDF margin settings.
class PdfSettingsDialog extends StatefulWidget {
  const PdfSettingsDialog({super.key});

  @override
  State<PdfSettingsDialog> createState() => _PdfSettingsDialogState();

  /// Show the pdf settings dialog.
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const PdfSettingsDialog(),
    );
  }
}

class _PdfSettingsDialogState extends State<PdfSettingsDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _textWidthController;
  late TextEditingController _lineHeightController;
  late TextEditingController _leftMarginController;
  late TextEditingController _bottomMarginController;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _textWidthController = TextEditingController(
      text: Data.pdfTextWidth.toString(),
    );
    _lineHeightController = TextEditingController(
      text: Data.pdfLineHeight.toString(),
    );
    _leftMarginController = TextEditingController(
      text: Data.pdfLeftMargin.toString(),
    );
    _bottomMarginController = TextEditingController(
      text: Data.pdfBottomMargin.toString(),
    );
  }

  @override
  void dispose() {
    _textWidthController.dispose();
    _lineHeightController.dispose();
    _leftMarginController.dispose();
    _bottomMarginController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await Data.savePdfSettings(
        textWidth: double.parse(_textWidthController.text),
        lineHeight: double.parse(_lineHeightController.text),
        leftMargin: double.parse(_leftMarginController.text),
        bottomMargin: double.parse(_bottomMarginController.text),
      );

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم حفظ إعدادات PDF بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في حفظ الإعدادات: $e'),
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
          constraints: const BoxConstraints(maxWidth: 400),
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
                  'تعديل إعدادات PDF',
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
                          controller: _textWidthController,
                          label: 'عرض النص',
                          icon: Icons.width_full,
                          hint: 'مثال: 200',
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _lineHeightController,
                          label: 'ارتفاع السطر',
                          icon: Icons.height,
                          hint: 'مثال: 14',
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _leftMarginController,
                          label: 'الهامش الأيسر',
                          icon: Icons.margin,
                          hint: 'مثال: 20',
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _bottomMarginController,
                          label: 'الهامش السفلي',
                          icon: Icons.vertical_align_bottom,
                          hint: 'مثال: 165',
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'تنبيه: القيم بالنقاط (Points)، زيادة الهامش السفلي يرفع النص للأعلى.',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textDirection: TextDirection.ltr, // Numbers are usually LTR
      textAlign: TextAlign.right,
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
        if (double.tryParse(value) == null) {
          return 'يرجى إدخال رقم صحيح';
        }
        return null;
      },
    );
  }
}
