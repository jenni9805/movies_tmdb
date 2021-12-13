import 'package:flutter/material.dart';

import 'package:movies_v2/src/resources/endpoints.dart';

class PosterAndTileDetails extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final double stars;
  final String duration;

  const PosterAndTileDetails({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.stars,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.20,
      child: Row(
        children: [
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const NetworkImage(Endpoints.urlImageError),
                image: NetworkImage(image),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                const SizedBox(height: 5),
                Text(duration,
                    style: textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star, size: 15, color: Colors.yellow),
                    const SizedBox(width: 5),
                    Text('$stars', style: textTheme.caption)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
