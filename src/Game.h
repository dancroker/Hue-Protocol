#ifndef WHACKAMOLESFML_GAME_H
#define WHACKAMOLESFML_GAME_H

#include <SFML/Graphics.hpp>
#include "MapGrid.h"

enum GAME_STATE
{
  MENU,
  GAME,
  PAUSE
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
  sf::CircleShape ball;
  int x = 0;
  int y = 0;
   sf::Clock clock;

   MapGrid mapGridOne = MapGrid(10, 10);
   MapGrid mapGridTwo = MapGrid(10, 10);

};

#endif // WHACKAMOLESFML_GAME_H
