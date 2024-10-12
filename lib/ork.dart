//import 'dart:ffi';
import 'dart:io';

import 'package:game_rpg/charecter.dart';

class Ork extends Character {
  int axeCoolDown = 0;
  int headAttackRarity = 0;

  Ork({
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
      print("Выберите атаку: 1 - Топор, 2 - Удар головой, 3 - Удар ногой, 4 - Ульта: восполняяет 20 ед. здоровья");
      int index = int.parse(stdin.readLineSync() ?? '3');

      switch (index) {
        case 1:
          if (axeCoolDown == 0) {
            axeCoolDown = 3;
            return axeHit();
          } else {
            print('Топор больше не доступен!');
            return chooseAttack();
          }
        case 2:
          if (headAttackRarity == 0) {
            headAttackRarity = 2;
            return headHit();
          } else {
            print('Удар головой не доступен!');
            return chooseAttack();
          }
        case 3:
          return legKick();
        case 4:
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
    hp += 20;
    print("$name восстанавливает 20 HP. Теперь у него $hp HP.");
    return 0;
  }

  @override
  updateCooldown() {
    if (axeCoolDown > 0) {
      axeCoolDown--;
    }
    if (headAttackRarity > 0) {
      headAttackRarity--;
    }
  }

  int axeHit() {
    print("$name атакует c помощью топора!");
    return (extraDamage ?? 0) + 10;
  }

  int headHit() {
    print("$name атакует головой!");
    return (extraDamage ?? 0) + 5;
  }

  int legKick() {
    print("$name делает удар ногой!");
    return (extraDamage ?? 0) + 2;
  }
}
