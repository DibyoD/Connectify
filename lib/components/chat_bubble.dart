import 'dart:io';

import 'package:chatapp/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String image;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final File file = File(image);

    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 15),
      child: message != ""
          ? Text(
              message,
              style: TextStyle(
                  color: isCurrentUser
                      ? Colors.white
                      : (isDarkMode ? Colors.white : Colors.black),
                  fontSize: 16),
            )
          : InstaImageViewer(
            child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(file),
                      fit: BoxFit.contain,
                    )),
              ),
          ),
    );
  }
}
