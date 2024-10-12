//import 'package:game_rpg/game_rpg.dart' as game_rpg;

import 'package:game_rpg/charecter.dart';
import 'package:game_rpg/elf.dart';
import 'package:game_rpg/magician.dart';
import 'package:game_rpg/ork.dart';
import 'dart:io';

import 'package:game_rpg/paladin.dart';

void main(List<String> arguments) {

  print("Игрок 1, выберите персонажа:");
  Character player1 = selectCharacter();

  print("Игрок 2, выберите персонажа:");
  Character player2 = selectCharacter();

  print("\nИгрок 1: ${player1.name} (${player1.charClass})");
  print("Игрок 2: ${player2.name} (${player2.charClass})");

  // Запускаем бой
  battle(player1, player2);
}





void battle(Character player1, Character player2) {
  while (player1.isAlive() && player2.isAlive()) {
    // Ход первого игрока
    print("\n--- Ход ${player1.name} (${player1.charClass}) ---");

    int damageDealt = player1.chooseAttack();

    player2.takeDamage(damageDealt);

    print("${player1.name} наносит $damageDealt урона ${player2.name}!");

    if (!player2.isAlive()) {
      print("\n${player2.name} проиграл! Победитель: ${player1.name}");
      break;
    }

    print("\nЗдоровье ${player1.name}: ${player1.hp}");

    print("Здоровье ${player2.name}: ${player2.hp}");

    player1.updateCooldown();




    // Ход второго игрока
    print("\n--- Ход ${player2.name} (${player2.charClass}) ---");

    damageDealt = player2.chooseAttack();

    player1.takeDamage(damageDealt);

    print("${player2.name} наносит $damageDealt урона ${player1.name}!");

    if (!player1.isAlive()) {
      print("\n${player1.name} проиграл! Победитель: ${player2.name}");
      break;
    }

    print("\nЗдоровье ${player1.name}: ${player1.hp}");

    print("Здоровье ${player2.name}: ${player2.hp}");

    player2.updateCooldown();
  }
}



Character selectCharacter() {
  print("Выберите тип персонажа:");
  print("1 - Ork");
  print("2 - Elf");
  print("3 - Paladin");
  print("4 - Magician");

  int choice = int.parse(stdin.readLineSync() ?? '1');
  
  switch (choice) {
    case 1:
    print("Введите имя персонажа (Орк):");
    String player1Name = stdin.readLineSync()!;
      return Ork(
        name: player1Name,
        hp: 120,
        armor: 0,
        extraDamage: 5,
        ulta: 1,
        charClass: 'Орк',
      );

    case 2:
    print("Введите имя персонажа (Эльф):");
    String player2Name = stdin.readLineSync()!;
      return Elf(
        name: player2Name,
        hp: 80,
        armor: 0,
        extraDamage: 0,
        ulta: 50,
        charClass: "Elf",
      );

    case 3:
    print("Введите имя персонажа (Паладин):");
    String player3Name = stdin.readLineSync()!;
      return Paladin(
        name: player3Name,
        hp: 130,
        armor: 5,
        extraDamage: 0,
        ulta: 1,
        charClass: "Paladin",
      );

    case 4:
    print("Введите имя персонажа (Паладин):");
    String player4Name = stdin.readLineSync()!;
      return Magician(
        name: player4Name,
        hp: 70,
        armor: 0,
        extraDamage: 0,
        ulta: 50,
        charClass: "Magician",
      );
    default:
      print("Неверный выбор. Будет создан персонаж Ork по умолчанию.");
      return Ork(
        name: 'Грог',
        hp: 120,
        armor: 15,
        extraDamage: 5,
        ulta: 50,
        charClass: 'Орк',
      );
  }
}
