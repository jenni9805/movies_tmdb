
import 'dart:ui';

import 'package:flutter/material.dart';

class CardEpisode extends StatelessWidget {
  final String image;
  const CardEpisode({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
       children: [
         Container(
           width: 200,
           height: 300,
           decoration:  BoxDecoration(
             color: Colors.red,
             image: DecorationImage(
                 image: NetworkImage(image),
                 fit: BoxFit.cover
             ),
             borderRadius: const BorderRadius.only(
               topLeft: Radius.circular(15),
               topRight: Radius.circular(15),
               bottomRight: Radius.circular(15),
               bottomLeft: Radius.circular(15),
             ),
           ),
         ),
         Container(
           width: 200,
           height: 50,
           decoration: const BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(
               bottomRight: Radius.circular(15),
               bottomLeft: Radius.circular(15),
             )
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.end,
             mainAxisSize: MainAxisSize.min,
             children: [
               const Text(
                 'data',
                 maxLines: 1,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 15,
                 ),
               ),
               Row(
                 children: const [
                   Icon(
                     Icons.star,
                     color: Colors.yellow,
                     size: 15,
                   ),
                   Text(
                     'stars',
                     style: TextStyle(
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
    );
  }
}
