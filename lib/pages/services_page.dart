import 'package:flutter/material.dart';

class ServicesPageSimple extends StatelessWidget {
  const ServicesPageSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الخدمات',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildSectionHeader('العامة'),
            _buildServiceItem(
              icon: Icons.verified,
              title: 'رمز توكلنا',
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات التصاريح'),
            _buildServiceItem(
              icon: Icons.person,
              title: 'التصاريح الشخصية',
              color: Colors.green,
            ),
            _buildServiceItem(
              icon: Icons.health_and_safety,
              title: 'تصاريح التحقق الآلي للحالة الصحية',
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الصحة'),
            _buildServiceItem(
              icon: Icons.local_hospital,
              title: 'لقاح كورونا',
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('خدمات السفر'),
            _buildServiceItem(
              icon: Icons.airplanemode_active,
              title: 'الجواز الصحي',
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('أفراد الأسرة'),
            _buildServiceItem(
              icon: Icons.family_restroom,
              title: 'رعاية أفراد الأسرة',
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            _buildSectionHeader('الرقمية'),
            _buildServiceItem(
              icon: Icons.dashboard,
              title: 'لوحة البيانات',
              color: Colors.teal,
            ),
          ],
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

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle service item tap
          // You can navigate or show details here
        },
      ),
    );
  }
}

class ServicesPageRtl extends StatelessWidget {
  const ServicesPageRtl({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F5F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('الخدمات', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: const Center(child: Text('صفحة الخدمات - ضع محتوى الخدمات هنا')),
      ),
    );
  }
}

// Main Services Page
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الخدمات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // General Section
              _buildSectionHeader('العامة'),
              _buildServiceItem(
                icon: Icons.verified,
                title: 'رمز توكلنا',
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              // Permits Section
              _buildSectionHeader('خدمات التصاريح'),
              _buildServiceItem(
                icon: Icons.person,
                title: 'التصاريح الشخصية',
                color: Colors.green,
              ),
              _buildServiceItem(
                icon: Icons.health_and_safety,
                title: 'تصاريح التحقق الآلي للحالة الصحية',
                color: Colors.green,
              ),
              _buildServiceItem(
                icon: Icons.add_circle_outline,
                title: 'إصدار تصريح تحقق آلي للحالة الصحية',
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              // Health Section
              _buildSectionHeader('الصحة'),
              _buildServiceItem(
                icon: Icons.help_outline,
                title: 'اسأل عن مساعدة',
                color: Colors.red,
              ),
              _buildServiceItem(
                icon: Icons.local_hospital,
                title: 'لقاح كورونا',
                color: Colors.red,
              ),

              const SizedBox(height: 20),

              // Travel Services Section
              _buildSectionHeader('خدمات السفر'),
              _buildServiceItem(
                icon: Icons.airplanemode_active,
                title: 'الجواز الصحي',
                color: Colors.purple,
              ),

              const SizedBox(height: 20),

              // Family Section
              _buildSectionHeader('أفراد الأسرة'),
              _buildServiceItem(
                icon: Icons.family_restroom,
                title: 'رعاية أفراد الأسرة',
                color: Colors.orange,
              ),
              _buildServiceItem(
                icon: Icons.people_outline,
                title: 'أفراد الأسرة والفاطمين',
                color: Colors.orange,
              ),

              const SizedBox(height: 20),

              // Digital Section
              _buildSectionHeader('الرقمية'),
              _buildServiceItem(
                icon: Icons.wallet,
                title: 'الخدمات المختلفة الرقمية',
                color: Colors.teal,
              ),
              _buildServiceItem(
                icon: Icons.dashboard,
                title: 'لوحة البيانات',
                color: Colors.teal,
              ),
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

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle service item tap
          print('Tapped: $title');
        },
      ),
    );
  }
}

// Main App with Bottom Navigation
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tawakkalna',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'SF Arabic', // Use an Arabic font if available
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 3; // Default to الخدمات (index 3)

  final List<Widget> _pages = [
    const PlaceholderWidget(title: 'حسابي'),
    const PlaceholderWidget(title: 'لوحة البيانات'),
    const PlaceholderWidget(title: 'المحفظة الرقمية'),
    const ServicesPage(), // الخدمات page
    const PlaceholderWidget(title: 'الرئيسية'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Placeholder for other pages
class PlaceholderWidget extends StatelessWidget {
  final String title;

  const PlaceholderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title Page', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Bottom Navigation Bar Widget
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'لوحة البيانات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'المحفظة الرقمية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.miscellaneous_services),
          label: 'الخدمات',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      ],
    );
  }
}
