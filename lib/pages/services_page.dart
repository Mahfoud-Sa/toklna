import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:toklna/pages/passport.dart';
import 'package:toklna/utils/pdf_generator.dart';
import 'package:toklna/widgets/tawakkalna_certificate.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pattern.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'الخدمات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              _buildSectionHeader('العامة'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_1.jpeg",
                    title: 'رمز توكلنا',
                    color: Colors.blue,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionHeader('خدمات التصاريح'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_2.jpg",
                    title: 'التصاريح الشخصية',
                    color: Colors.green,
                  ),
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_3.png",
                    title: 'تصاريح التحقق الآلي للحالة الصحية',
                    color: Colors.green,
                  ),
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_4.png",
                    title: 'ماسح كود التحقق',
                    color: Colors.green,
                  ),
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_5.png",
                    title: 'اصدار تسريح تحقق الي للحالة الصحية',
                    color: Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionHeader('الصحة'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_6.png",
                    title: 'اسل عن مساعدة',
                    color: Colors.red,
                  ),
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_7.png",
                    title: 'لقاح كورونا',
                    color: Colors.red,
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HealthPassportPage()),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionHeader('خدمات السفر'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_8.png",
                    title: 'الجواز الصحي',
                    color: Colors.purple,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionHeader('أفراد الأسرة'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_9.png",
                    title: 'رعاية أفراد الأسرة',
                    color: Colors.orange,
                  ),
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_10.png",
                    title: 'افراد الاسرة والعاملين',
                    color: Colors.orange,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionHeader('الرقمية'),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildServiceItem(
                    context,
                    name: "assets/icons/icon_1.jpeg",
                    title: 'لوحة البيانات',
                    color: Colors.teal,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildServiceItem(
    BuildContext context, {
    required String name,
    required String title,
    required Color color,
    VoidCallback? onTap,
  }) {
    // Use a fixed tile size for consistent appearance
    const double tileSize = 110;

    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: tileSize,
        height: tileSize,
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(name, width: 40, height: 40, fit: BoxFit.contain),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String path;

  const PdfViewerPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              try {
                final file = File(path);
                final bytes = await file.readAsBytes();
                await Printing.sharePdf(
                  bytes: bytes,
                  filename: 'health_certificate.pdf',
                );
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('فشل في المشاركة: $e')));
              }
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
      ),
    );
  }
}
