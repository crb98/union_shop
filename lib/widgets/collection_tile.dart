import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  final double borderRadius;

  const CollectionTile({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                imageUrl.startsWith('http')
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, st) {
                          return Container(
                            color: Colors.grey.shade100,
                            child: const Center(
                              child:
                                  Icon(Icons.image_not_supported, color: Colors.grey),
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, st) {
                          return Container(
                            color: Colors.grey.shade100,
                            child: const Center(
                              child:
                                  Icon(Icons.image_not_supported, color: Colors.grey),
                            ),
                          );
                        },
                      ),

                Container(color: const Color.fromRGBO(0, 0, 0, 0.35)),
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        shadows: [Shadow(blurRadius: 6, color: Colors.black54, offset: Offset(0, 2))],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}