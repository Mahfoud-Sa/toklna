import 'package:flutter/material.dart';

class TawakkalnaIdCard extends StatelessWidget {
  final String name;
  final String idNumber;
  final String imageUrl;

  const TawakkalnaIdCard({
    super.key,
    required this.name,
    required this.idNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile Image
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.teal,
            child: CircleAvatar(
              radius: 42,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),

          const SizedBox(height: 12),

          // Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),

          const SizedBox(height: 6),

          // ID Number
          Text(
            idNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.teal),
          ),

          const SizedBox(height: 18),

          // Tawakkalna Logo Row
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.check_circle, color: Colors.teal, size: 32),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "توكلنا",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Tawakkalna",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
