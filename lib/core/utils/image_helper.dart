import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:ui' as ui;
import 'dart:html' as html;

class UniversalNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const UniversalNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isValid = url.trim().isNotEmpty;
    final fallbackUrl = 'https://avatar.iran.liara.run/public/';
    final finalUrl = isValid ? url : fallbackUrl;

    if (kIsWeb) {
      ui.platformViewRegistry.registerViewFactory(
        finalUrl,
        (int _) => html.ImageElement()
          ..src = finalUrl
          ..width = width.toInt()
          ..height = height.toInt()
          ..style.objectFit = 'cover'
          ..style.borderRadius = '8px',
      );

      return ClipOval(
        child: SizedBox(
          width: width,
          height: height,
          child: HtmlElementView(viewType: finalUrl),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        finalUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(strokeWidth: 2),
          );
        },
      ),
    );
  }
}
