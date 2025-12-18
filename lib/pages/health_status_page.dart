import 'package:flutter/material.dart';
import 'package:toklna/widgets/progress_square.dart';

class HealthStatusPage extends StatefulWidget {
  const HealthStatusPage({super.key, this.scrollController});

  /// Optional scroll controller for use in bottom sheets.
  final ScrollController? scrollController;

  @override
  State<HealthStatusPage> createState() => _HealthStatusPageState();

  static String _formatDateTime() {
    final now = DateTime.now();
    const arabicDays = [
      'الإثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد',
    ];
    const arabicMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    final dayName = arabicDays[now.weekday - 1];
    final monthName = arabicMonths[now.month - 1];
    final hour = now.hour > 12
        ? now.hour - 12
        : (now.hour == 0 ? 12 : now.hour);
    final period = now.hour >= 12 ? 'م' : 'ص';
    final minute = now.minute.toString().padLeft(2, '0');

    return '$dayName ${now.day} $monthName $hour:$minute $period';
  }
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  final double _value = 0.0;
  final bool _auto = true;
  @override
  Widget build(BuildContext context) {
    // If scrollController is provided, we're in a bottom sheet, so skip Scaffold
    if (widget.scrollController != null) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        padding: const EdgeInsets.all(16),
        child: _buildContent(),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        // QR Code Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1B5E20), // Dark green
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ProgressSquare(
                innerPadding: 4,
                progress: _value,
                size: 180,
                strokeWidth: 4,
                trackColor: Colors.transparent,
                progressColor: Colors.white,
                auto: _auto,
                duration: const Duration(seconds: 14),
                speed: 3.0,
                child: Image.asset(
                  'assets/qr_code.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'أكمل جرعات لقاح كورونا (كوفيد-19)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'آخر تحديث: ${HealthStatusPage._formatDateTime()}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Health Status Section Title
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'الوضع الصحي',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Description
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'تعتبر الأكواد الملونة طريقة لحفظ الخصوصية ومعرفة الوضع الصحي للمستخدم وفقاً للبيانات الرسمية التي تصلنا من وزارة الصحة، كما أنها تحفظ البيانات الشخصية بسفير عالي.',
            style: TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ),

        const SizedBox(height: 24),

        // Status Cards
        _buildStatusCard(
          title: 'محصّن',
          description:
              'اللون الاخضر الداكن يوضح أن المستفيد قد أكمل جرعات لقاح كورونا (كوفيد-19).',
          imagePath: 'assets/barcode_1.png',
        ),

        _buildStatusCard(
          title: 'مستثنى',
          description:
              'مستثنى لأسباب طبية:يوضح أن المستفيد أعتمد من قبل لجنة الاستثناءات الطبية في الصحة العامة,وأنه مستثنى من لقاح كورونا وفق لائحة الفئات المستثناة الخاضعة لوزارة الصحة.',
          imagePath: 'assets/barcode_1.png',
        ),
        _buildStatusCard(
          title: 'لم تثبت اضابته',
          description:
              "اللون الاخضر يوضح ان المستفيد ذه 12 سنة أو اقل لم تثبت اصابته, ولم بتلق لقاح كورونا",
          imagePath: 'assets/barcode_1.png',
        ),
        _buildStatusCard(
          title: 'زائر مؤمن',
          description:
              "اللون الأخضر يوضح أن المستفيد زائر من خارج المملكة ولدية تأمين طبي فعال.",
          imagePath: 'assets/barcode_1.png',
        ),

        _buildStatusCard(
          title: 'زائر غير مؤمن',
          description:
              "اللون الأبيض يوضح أن المستفيد زائر من خارج المملكة وليس لديه تأمين طبي فعال.",
          imagePath: 'assets/barcode_3.png',
        ),
        _buildStatusCard(
          title: 'غير مكتمل التحصين',
          description:
              "اللون الأبيض يوضح أن المستفيد قد حصل على جزء من اللقاحات ويتم عرضها بعد مرور 14 يوم من الحصول على الجرعة.",
          imagePath: 'assets/barcode_3.png',
        ),
        _buildStatusCard(
          title: "غير محصّن",
          description:
              'اللون الاخضر يوضح أن المستفيد ذو 12 سنة او أقل لم تثبت إصابته , ولم ينلق لقاح كورونا.',
          imagePath: 'assets/barcode_3.png',
        ),

        _buildStatusCard(
          title: 'مخالط',
          description:
              "اللون البرتقالي يوضح أن المستفيد تمت اكتشاف نحالطته لشخص مصاب او يسكن معه في نفس السكن ولا يسمح له بمغادرة المنزل أو طلب أي نوع من التصاريح وعليه الالتزام بالحجر لمدة 7أيام.",
          imagePath: 'assets/barcode_4.png',
        ),
        _buildStatusCard(
          title: 'مصاب',
          description: "اللون البني يوضح أن المتفيد ثيتت إصابته بقيروس كورونا.",
          imagePath: 'assets/barcode_5.png',
        ),
        _buildStatusCard(
          title: 'الحالة الصحية غير معروفة',
          description:
              "اللون الرمادي يوضح أن المستفيد ليس لديه بيانات لدى وزراة الصحة",
          imagePath: 'assets/barcode_6.png',
        ),
        _buildStatusCard(
          title: 'غير معرّف',
          description:
              "اللون الرمادي يوضح أن المستفدم لا يوجد لديه اتصال بالإنترنت أو لم يحدد موقع سكنه,او أنه يستخدم شبكة افتراضية خاصة (VPN).",
          imagePath: 'assets/barcode_6.png',
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStatusCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // QR Icon

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
