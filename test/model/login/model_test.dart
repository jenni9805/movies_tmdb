import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:movies_v2/src/data_source/api_provider.dart';
import 'package:movies_v2/src/model/login/user_model.dart';

void main() {
  //test sin mapeo
  test('Test 1', () {
    final user = UserModel(
      userId: 1,
      id: 1,
      title: '',
      body: '',
    );

    expect(user.userId, '1');
    expect(user.id, '1');
    expect(user.title, '');
    expect(user.body, '');
  });

//test con mapeo para recibir todos los campos
  test('Test 2', () {
    final file = File('test/test_resources/random_user.json')
        .readAsStringSync();

    final user = UserModel.fromJson(jsonDecode(file) as Map<String, dynamic>);
    expect(user.userId, 1);
    expect(user.id, 1);
      expect(
      user.title,
      'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    );
    expect(
      user.body,
      'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    );
  });

//test con mapeo que recibe nulos
  test('Test 3', () {
    final file = File('test/test_resources/random_user.json')
        .readAsStringSync();

    final user = UserModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

    expect(user.userId, 0);
    expect(user.id, 0);
    expect(
      user.title,
      'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    );
    expect(
      user.body,
      'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    );
  });



  //Test directo a la api con http
  test('Test 4', () async {
    Future<http.Response> _mockRequest(http.Request request) async {
      if (request.url
          .toString()
          .startsWith('https://jsonplaceholder.typicode.com/posts/')) {
        return http.Response(
            File('test/test_resources/random_user.json').readAsStringSync(),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            });
      }
      return http.Response('Error: Unknown endpoint', 404);
    }

    final apiProvider = ApiProvider(MockClient(_mockRequest));
    final user = await apiProvider.getUser();
    expect(user.userId, 1);
    expect(user.id, 1);
    expect(
      user.title,
      'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    );
    expect(
      user.body,
      'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
    );
  });


}
