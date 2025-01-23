import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ViewFullArticleButton extends StatelessWidget {
  final String? url;

  const ViewFullArticleButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () async {
          if (url != null && await canLaunchUrlString(url!)) {
            launchUrlString(url!, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cannot open URL")),
            );
          }
        },
        icon: const Icon(Icons.open_in_new),
        label:   Text(S.of(context).viewFullArticle),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}