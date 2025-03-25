import 'package:flutter/material.dart';

class InstrumentGallery extends StatelessWidget {
  final List<String> imagePaths;
  final VoidCallback onAddImage;

  const InstrumentGallery({
    super.key,
    required this.imagePaths,
    required this.onAddImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: imagePaths.length + 1, // +1 для кнопки "Добавить"
        itemBuilder: (context, index) {
          if (index == imagePaths.length) {
            return GestureDetector(
              onTap: onAddImage,
              child: Container(
                color: const Color.fromARGB(255, 40, 40, 50),
                child: const Center(
                  child: Icon(Icons.add, color: Colors.white, size: 50),
                ),
              ),
            );
          }
          return Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color.fromARGB(255, 18, 18, 23),
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
