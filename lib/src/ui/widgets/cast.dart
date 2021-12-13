import 'package:flutter/material.dart';
import 'package:movies_v2/src/resources/endpoints.dart';

class CastCard extends StatelessWidget {
  final String image;
  final String name;

  const CastCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image == ''
                    ? const NetworkImage(Endpoints.urlImageError)
                    : NetworkImage(image),
                fit: BoxFit.fill,
              ),
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 30,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
