import 'package:flutter_test/flutter_test.dart';
import 'package:prjct2/models/players/Player.dart';

void main() {
  group('Teste para o player', (() {
    test('Player começa com 100 de vida', () async {
      Player player = Player('_name', '_age');
      expect(player.life, 100);
    });

    test('Player começa vivo', () async {
      Player player = Player('_name', '_age');
      expect(player.dead, false);
    });

    test('Player revive', () async {
      Player player = Player('_name', '_age');
      player.life = 30;
      player.revive();
      expect(player.life, 100);
    });

    test('Player toma dano', () async {
      Player player = Player('_name', '_age');
      player.takeDamage(player);
      expect(player.life, 90);
    });

    test('Vida baixa?', () async {
      Player player = Player('_name', '_age');

      player.life = 10;
      bool vidaBaixa = player.checkLowLife();

      expect(vidaBaixa, false);
    });
  }));
}
