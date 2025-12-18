import 'package:flutter/material.dart';
import 'package:toklna/data.dart';

/// A widget that displays an image, and when tapped, shows a dialog
/// with a user profile containing another image, name, and ID.
class UserProfileDialog extends StatelessWidget {
  const UserProfileDialog({
    super.key,
    required this.triggerImagePath,
    required this.profileImagePath,
    this.triggerWidth = 300,
    this.triggerHeight = 300,
    this.userName,
    this.userId,
  });

  /// The image path for the trigger image (the one shown before tapping).
  final String triggerImagePath;

  /// The image path for the profile image inside the dialog.
  final String profileImagePath;

  /// Width of the trigger image.
  final double triggerWidth;

  /// Height of the trigger image.
  final double triggerHeight;

  /// User's name displayed in the dialog. If null, reads from Data.userName.
  final String? userName;

  /// User's ID displayed in the dialog. If null, reads from Data.passportNumber.
  final String? userId;

  /// Gets the user name from parameter or from stored data.
  String get _userName => userName ?? Data.userName;

  /// Gets the user ID from parameter or from stored data.
  String get _userId => userId ?? Data.passportNumber;

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Stack(
                children: [
                  Container(
                    width: 300,
                    height: 350,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(profileImagePath),
                        ),
                        const Spacer(),
                        Text(
                          _userName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D6E5A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _userId,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0D6E5A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // X close button at top-left
                  Positioned(
                    top: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Color(0xFF0D6E5A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProfileDialog(context),
      child: Image(
        image: AssetImage(triggerImagePath),
        width: triggerWidth,
        height: triggerHeight,
      ),
    );
  }
}
