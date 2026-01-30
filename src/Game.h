#ifndef WHACKAMOLESFML_GAME_H
#define WHACKAMOLESFML_GAME_H

#include <SFML/Graphics.hpp>

enum GAME_STATE
{
  MENU,
  GAME,
  PAUSE
};

enum PlayerOptions
{
    Null =0,
  Up     = 1,
  down   = 2,
  left   = 3,
  right  = 4,
  attack = 5,
  attackselected = 6,
  enemyturn      = 7    

};
  class Game
{
 public:
  Game(sf::RenderWindow& window);
  ~Game();
  bool init();
  void update(float dt);
  void render();
  void mouseClicked(sf::Event event);
  void keyPressed(sf::Event event);
  void keyReleased(sf::Event event);
  sf::RenderWindow& window;
 

 private:
  PlayerOptions type = PlayerOptions::Up;
  sf::CircleShape ball;
  bool collisionCheck(sf::Vector2i click, sf::Sprite& sprite);
  void spawnEnemy(int amount);
  void spawnPlayer();
  int x = 0;
  int y = 0;
  /// <summary>
  /// </summary>
   sf::Clock clock;

};

#endif // WHACKAMOLESFML_GAME_H
