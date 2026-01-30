
#include "Game.h"
#include <iostream>


Game::Game(sf::RenderWindow& game_window) : window(game_window)
{
  srand(time(NULL));
}

Game::~Game() {}

bool Game::init()
{
  mapGridOne.createMaze(1);
  mapGridOne.printGrid();
  std::cout << "-----------------" << std::endl;
  mapGridTwo.createMaze(2);
  mapGridTwo.printGrid();
  return true;
}

// UPDATE FUNCTION
void Game::update(float dt)
{

}

void Game::render()
{
  
 
  
  
}

void Game::mouseClicked(sf::Event event)
{
  // get the click position
  sf::Vector2i click = sf::Mouse::getPosition(window);
  
 
  
  
}

void Game::keyPressed(sf::Event event)
{

  
}





