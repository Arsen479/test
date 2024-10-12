import 'dart:io';

import 'package:game_rpg/charecter.dart';

class Magician extends Character {
  Magician({
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
      
      print("Выберите атаку: 1 - Огненный шар, 2 - Ляденная игла, 3 - Молния");
      int index = int.parse(stdin.readLineSync() ?? '3');

      switch (index) {
        case 1:
          return fireball();
        case 2:
          return iceSpike();
        case 3:
          return lightning();
        default:
          return 0;
      }
    }
  }

  @override
  void useUlta(){

  }

  int fireball() {
    print("$name использует огненный шар!");
    return (extraDamage ?? 0) + 25;
  }

  int iceSpike() {
    print("$name использует ледяную иглу!");
    return (extraDamage ?? 0) + 20;
  }

  int lightning() {
    print("$name использует молнию!");
    return (extraDamage ?? 0) + 30;
  }
}
