 # = WARRIOR VS. WIZARD (Dart) =

 ## What it is:

This project is a mini RPG game simulation made with Dart and some passing for games. It allow´s us to instantiate a game object (to act as the game world), as well as adding weapons, characters and managing fighting actions. For the sake of simplicity, it simulates an warrior vs. wizard fight and two weapons, but this project can be expanded to simulate any character class fighting, using any sort of weapon.

## How you can run this project in VS Code

* Install Dart SDK, and make necessary environment variables adjustments to run dart on your machine. You should be able to run the command ```dart --version```, and get dart vertion logged into your terminal. This step might be already configured if you use Flutter
* Have __VS Code__ with the __Code Runner__ plugin installed
* Open __main.dart__ file and run it with Ctrl + ALT + N

## About the object oriented approach

In order to have a clean and organized structure, many object oriented programming concepts can be seen here, such as:

* Constructors
* Access modifiers
* Getters and setters
* Inheritance
* Method overriding and polymorphism
* Class as "interface" (implements)
* Abstract classes
* Static methods and fields

## Features

* Character (abstract Dart class) can be extended to implement any game character class. __Warrior__ and __Wizard__ are already provided
* Weapon (abstract Dart class) can be extended to implement any game weapon. __Sword__ and __Wand__ are already provided
* Simulates a game world, enabling the ability to hold items and global actions/events
* Characters can have it´s level adjusted, and it will reflect statuses accordingly
* Allows a two characters fight untill one of them can be considered the winner. A game instance with a battle example is provided
* Special skills: Character´s class special skills, characters´s ultimate and weapon skills can unleash powerfull attacks. Both of these have a cooldown
* Most of game actions are registered into the __battle-log.txt__(handled by Dart IO) file. This is where you can check this project´s outputs

## More about

This is an 100% open project, feel free to study, implement, share, use commercially and collaborate at will. If you want to see me developing more projects like this, you can send an incentive as a paypal donation to this e-mail: renato.lins.digital@gmail.com. Happy game coding!
