import 'package:flutter/material.dart';

class CardGeneral extends StatelessWidget {
  final String image;
  final String title;
  final double stars;
  final int position;
  final Function() route;

  const CardGeneral({
    Key? key,
    required this.image,
    required this.title,
    required this.stars,
    required this.position,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: InkWell(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 200,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Text(
                        '$stars',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: route,
      ),
    );
  }
}
