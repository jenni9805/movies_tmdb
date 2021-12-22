import 'package:flutter_test/flutter_test.dart';
import 'package:movies_v2/src/notifiers/counter.dart';

void main() {
  final counter = Counter();
  group('Counter', () {
    test('Contador iniciado', () {
      expect(counter.value, 0);
    });

    test('Contador incrementado', () {
      counter.increment();
      expect(counter.value, 1);
    });

    test('Contador decrementado', () {
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
