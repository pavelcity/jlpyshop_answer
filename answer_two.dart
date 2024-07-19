//Добавьте зависимость от библиотеки test в pubspec.yaml:

dev_dependencies:
  test: ^1.16.0


//Создайте файл test/game_test.dart для написания тестов.

// test/game_test.dart
import 'package:test/test.dart';
import 'package:game/game.dart';

void main() {
  group('getScore', () {
    test('should return 0-0 for an empty gameStamps list', () {
      final gameStamps = <Stamp>[];
      final score = getScore(gameStamps, 10);
      expect(score.home, 0);
      expect(score.away, 0);
    });

    test('should return the initial score if offset is less than the first stamp', () {
      final gameStamps = [
        Stamp(offset: 5, score: Score(home: 1, away: 0)),
        Stamp(offset: 10, score: Score(home: 1, away: 1)),
      ];
      final score = getScore(gameStamps, 3);
      expect(score.home, 1);
      expect(score.away, 0);
    });

    test('should return the correct score for an exact match', () {
      final gameStamps = [
        Stamp(offset: 5, score: Score(home: 1, away: 0)),
        Stamp(offset: 10, score: Score(home: 1, away: 1)),
      ];
      final score = getScore(gameStamps, 10);
      expect(score.home, 1);
      expect(score.away, 1);
    });

    test('should return the last score before the offset when in between stamps', () {
      final gameStamps = [
        Stamp(offset: 5, score: Score(home: 1, away: 0)),
        Stamp(offset: 10, score: Score(home: 1, away: 1)),
      ];
      final score = getScore(gameStamps, 7);
      expect(score.home, 1);
      expect(score.away, 0);
    });

    test('should return the last score if offset exceeds the last stamp', () {
      final gameStamps = [
        Stamp(offset: 5, score: Score(home: 1, away: 0)),
        Stamp(offset: 10, score: Score(home: 1, away: 1)),
      ];
      final score = getScore(gameStamps, 15);
      expect(score.home, 1);
      expect(score.away, 1);
    });
  });
}
