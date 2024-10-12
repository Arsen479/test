import 'dart:io';

import 'package:game_rpg/charecter.dart';

class Elf extends Character {
int magicArrowCooldown = 0;

  Elf({
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

      print("Выберите атаку: 1 - Выстрел стрелой, 2 -  Магическая стрела, 3 - Бытсрый удар");
      int index = int.parse(stdin.readLineSync() ?? '3');

      switch (index) {
        case 1:
          return arrowShoot();
        case 2:
        if(magicArrowCooldown == 0){
          magicArrowCooldown = 3;
          return magicArrow();
        }
        else{
          print('Магическая стрела не доступна!');
          return chooseAttack();
        }
        case 3:
          return punch();
        default:
          return 0;
      }
    }
  }

  @override
  void useUlta(){

  }

  @override
  updateCooldown(){
    if (magicArrowCooldown > 0) {
      magicArrowCooldown--;
    }
  }

  int arrowShoot() {
    print("$name стреляет стрелой!");
    return (extraDamage ?? 0) + 15;
  }

  int magicArrow() {
    print("$name использует магическую стрелу!");
    return (extraDamage ?? 0) + 20;
  }

  int punch() {
    print("$name делает быстрый удар!");
    return (extraDamage ?? 0) + 2;
  }
}
