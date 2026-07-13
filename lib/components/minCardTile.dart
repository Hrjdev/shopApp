import 'package:flutter/material.dart';

class MinCardTile extends StatelessWidget {
  final String name;
  final String tagline;
  final String price;
  final String imageUrl;
  final VoidCallback? onRemove;

  const MinCardTile({
    super.key,
    required this.name,
    required this.tagline,
    required this.price,
    required this.imageUrl,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(8),
              image: imageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.contain,
                    ) // DecorationImage
                  : null,
            ), // BoxDecoration
            child: imageUrl.isEmpty
                ? const Icon(Icons.image, color: Colors.grey)
                : null,
          ), // Container
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ), // TextStyle
                ), // Text
                Text(
                  tagline,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                    color: Colors.grey,
                  ), // TextStyle
                ), // Text
                Text(
                  price,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ), // Text
              ],
            ), // Column
          ), // Expanded
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.grey,
            onPressed: onRemove,
          ), // IconButton
        ],
      ), // Row
    ); // Padding
  }
}
