import 'package:flutter/material.dart';

class OverviewDetails extends StatelessWidget {
  final String overview;

  const OverviewDetails({
    Key? key,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
