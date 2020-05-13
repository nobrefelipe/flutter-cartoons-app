import 'package:flutter/material.dart';

class Character {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final String cartoon;
  final List<Color> colors;

  Character({
    this.id,
    this.name,
    this.cartoon,
    this.description,
    this.imagePath,
    this.colors,
  });
}

// demo : https://www.uplabs.com/posts/super-smash-mobile-app

List characters = [

  Character(
    id: "agnes",
    name: "Agnes",
    cartoon: "Minions",
    description: "Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie.Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie.Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie.Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie. Most of the time, Agnes wears blue overalls over a yellow and brown striped t-shirt, and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.",
    imagePath: "assets/images/characters/agnes.png",
    colors: [Colors.pink.shade900, Colors.pink.shade500]
  ),
  
  Character(
    id: "pikachu",
    name: "Pikachu",
    cartoon: "Pokemon",
    description: "Pikachu are a species of Pokémon, fictional creatures that appear in an assortment of video games, animated television shows and movies, trading card games, and comic books licensed by The Pokémon Company, a Japanese corporation. They are yellow rodent-like creatures with powerful electrical abilities",
    imagePath: "assets/images/characters/pikachu-hd.png",
    colors: [Color.fromRGBO(225, 151, 32, 1),Colors.yellow.shade700]
  ),

  Character(
    id: "sonic",
    name: "Sonic",
    cartoon: "Sonic the Hedgehog",
    description: "Sonic the Hedgehog is a media franchise owned by Sega, centering on a series of high-speed platform games. Sonic, the protagonist, is an anthropomorphic blue hedgehog with supersonic speed.",
    imagePath: "assets/images/characters/sonic.png",
    colors: [Color.fromRGBO(0, 41, 98, 1), Color.fromRGBO(0, 122, 195, 1)]
  ),

  Character(
    id: "super-mario",
    name: "Mario",
    cartoon: "Super Mario",
    description: "Super Mario is a series of platform games created by Nintendo, and featuring their mascot, Mario. Alternatively called the Super Mario Bros. series or simply the Mario series, it is the central series of the greater Mario franchise",
    imagePath: "assets/images/characters/super-mario-2.png",
    colors: [Color.fromRGBO(229, 37, 33, 1), Colors.red.shade400]
  ),


  Character(
    id: "kevin",
    name: "Kevin",
    cartoon: "Minions",
    description: "Kevin, Stuart, and Bob are three of the most familiar minions, who appear as stars in the film Minions (2015). Kevin is tall, Bob is quite short, and Stuart has one eye. Many other minions are mentioned by name in the films and other media in the franchise",
    imagePath: "assets/images/characters/minion.png",
    colors: [Colors.orange.shade700, Colors.orange.shade300]
  ),

  

];