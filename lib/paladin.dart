import 'dart:io';

import 'package:game_rpg/charecter.dart';

class Paladin extends Character {
  int shield = 10;

  Paladin({
    required super.name,
    required super.hp,
    required super.armor,
    super.extraDamage,
    required super.ulta,
    required super.charClass,
  });

  @override
  int chooseAttack() {
    while (true) {
      print(
          "Выберите атаку: 1 - Удар щитом, 2 - Священный удар, 3 - Божественный щит, 4 - Удар мечом, 5 - Увеличевает броню на 10 ед.");
      int index = int.parse(stdin.readLineSync() ?? '3');

      switch (index) {
        case 1:
          return shieldBash();
        case 2:
          return holyStrike();
        case 3:
          return divineShield();
        case 4:
          return swordHit();
        case 5:
        if(ulta != 0){
          return useUlta();
        }
        else{
          print('Ультимативная способность больше не доступна');
          return chooseAttack();
        }
        default:
          return 0;
      }
    }
  }

  @override
  int useUlta() {
    print("$name использует ультимативную способность!");
    armor += 10;
    print("$name увеличивает  броню до $armor.");
    return 0;
  }

  @override
  void takeDamage(damage){
    int a = damage - armor;
    if (a >= 0) {
      hp -= a;
    }
    print('Получаемый урон снижен из за щита противник наносит: ${damage-armor < 0 ? 0 : damage-armor} ед. урана');
  }

  int shieldBash() {
    print("$name наносит удар щитом!");
    return (extraDamage ?? 0) + 10;
  }

  int holyStrike() {
    print("$name использует священный удар!");
    return (extraDamage ?? 0) + 15;
  }

  int divineShield() {
    print("$name активирует божественный щит!");
    return (extraDamage ?? 0) + 5;
  }

  int swordHit() {
    print("$name атакует с помощью меча!");
    return (extraDamage ?? 0) + 8;
  }
}
