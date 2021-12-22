import 'package:movies_v2/src/bloc/series/serie_top_rated_bloc.dart';
import 'package:movies_v2/src/ui/screens/sign_up_screen.dart';

class UserModel {
  static const dbUserId = 'userId';
  static const dbId = 'id';
  static const dbTitle = 'title';
  static const dbBody = 'body';

  final int userId;
  final int id;
  final String title;
  final String body;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json[dbUserId]?.toInt() ?? 0,
        id: json[dbId]?.toInt() ?? 0,
        title: json[dbTitle] ?? '',
        body: json[dbBody] ?? '',
      );

  Map<String, dynamic> toJson() => {
        dbUserId: userId,
        dbId: id,
        dbTitle: title,
        dbBody: body,
      };
}
