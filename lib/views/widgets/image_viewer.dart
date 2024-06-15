import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  ImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Colors.black,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
