import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/shimmer_image_loading.dart';

class ArticleImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
          )
        : Container(
            height: 200,
            color: Colors.grey.shade200,
            child: const Center(
              child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
            ),
          );
  }
}