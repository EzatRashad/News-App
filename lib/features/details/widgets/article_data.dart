import 'package:flutter/material.dart';

class ArticleData extends StatelessWidget {
  final String? sourceName;
  final String? title;
  final String? publishedAt;
  final String? description;
  final String? content;

  const ArticleData({
    super.key,
    this.sourceName,
    this.title,
    this.publishedAt,
    this.description,
    this.content,
  });

  String formatDate(String? date) {
    if (date == null) return '';
    try {
      DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sourceName != null)
          Text(
            sourceName!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),
          ),
        const SizedBox(height: 8),
        if (title != null)
          Text(
            title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        const SizedBox(height: 10),
        if (publishedAt != null)
          Text(
            formatDate(publishedAt),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        const SizedBox(height: 20),
        if (description != null)
          Text(
            description!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
          ),
        const SizedBox(height: 20),
        if (content != null)
          Text(
            content!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),
          ),
      ],
    );
  }
}