import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imageUrls;
  final void Function(String) onImageTap;

  const ImageGrid(
      {super.key, required this.imageUrls, required this.onImageTap});

  @override
  Widget build(BuildContext context) {
    switch (imageUrls.length) {
      case 0:
        return Container();
      case 1:
        return _buildSingleImage(imageUrls[0]);
      case 2:
        return _buildDoubleImages();
      case 3:
        return _buildTripleImages();
      default:
        return _buildGridImages();
    }
  }

  Widget _buildSingleImage(String imageUrl) {
    return GestureDetector(
      onTap: () => onImageTap(imageUrl),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDoubleImages() {
    return Row(
      children: imageUrls.map((url) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () => onImageTap(url),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                  height: 150.0,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTripleImages() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onImageTap(imageUrls[0]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(imageUrls[0]),
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4.0),
        Column(
          children: [
            GestureDetector(
              onTap: () => onImageTap(imageUrls[1]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(imageUrls[1]),
                  fit: BoxFit.cover,
                  height: 72.0,
                  width: 150.0,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            GestureDetector(
              onTap: () => onImageTap(imageUrls[2]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(imageUrls[2]),
                  fit: BoxFit.cover,
                  height: 72.0,
                  width: 150.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGridImages() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imageUrls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onImageTap(imageUrls[index]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(imageUrls[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
