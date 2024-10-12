//import 'dart:io';

//import 'package:game_rpg/ork.dart';

enum CharClass { ork, elf, paladin, magician }

abstract class Character {
  
  String name;
  int hp;
  int armor;
  int? extraDamage;
  int ulta;
  String charClass;


  Character({
    required this.name,
    required this.hp,
    required this.armor,
    this.extraDamage,
    required this.ulta,
    required this.charClass,
});

  // void showName(){
  //   print('my class $charClass, my name $name');
  // }

  void useUlta();

  void takeDamage(int damage) {
    hp -= damage;
    if (hp < 0) hp = 0; // Не допускаем отрицательного значения здоровья
  }

  bool isAlive() {
    return hp > 0;
  }

  int chooseAttack();

  void updateCooldown() {
  }
}



