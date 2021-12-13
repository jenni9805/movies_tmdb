import 'package:flutter/material.dart';

class AppBarDetails extends StatelessWidget {
  final String image;
  final String title;

  const AppBarDetails({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height * 0.267,
          width: size.width,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.267,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 20,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
