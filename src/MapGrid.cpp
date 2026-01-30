#include "MapGrid.h"

MapGrid::MapGrid(int width, int height)
{
  for (int i = 0; i < 10; i++)
  {
	  for (int j = 0; j < 10; j++)
	{
	  grid[i][j] = 0;
    }
  }
}
MapGrid::~MapGrid() {}

void MapGrid::setCellValue(int x, int y, int value) {}

int MapGrid::getCellValue(int x, int y)
{
  return 0;
}

int MapGrid::getWidth()
{
  return 10;
}

int MapGrid::getHeight()
{
  return 30;
}

float MapGrid::getCellSize()
{
  return 32.0f;
}

void MapGrid::printGrid()
{
  for (int i = 0; i < 10; i++)
  {
	for (int j = 0; j < 10; j++)
	{
	  std::cout << grid[i][j] << " ";
	}
	std::cout << std::endl;
  }
}

void MapGrid::createMaze(int option)
{
  bool validMaze = false;
  while (!validMaze)
  {
	for (int i = 0; i < 10; i++)
	{
       for (int j = 0; j < 10; j++)
       {
          int randomIndex = rand() % 5;
          if (randomIndex == 0)
          {
             grid[i][j] = 1;
          }
       }
	}

    for (int i = 0; i < 10; i++)
    {
      for (int j = 0; j < 10; j++)
      {
          int pathwayAccessable = 0;
          if (grid[i][j] == 1)
          {
            if (grid[i][j + 1] == 1)
            {
              pathwayAccessable++;
            }
            if (grid[i][j - 1] == 1)
            {
              pathwayAccessable++;
            }
            if (grid[i + 1][j] == 1)
            {
              pathwayAccessable++;
            }
            if (grid[i - 1][j] == 1)
            {
              pathwayAccessable++;
            }
            if (pathwayAccessable < 2)
            {
              grid[i][j] = 0;
            }
          }
      }
    }
    int filledCells = 0;
    for (int i = 0; i < 10; i++)
    {
      for (int j = 0; j < 10; j++)
      {
          if (grid[i][j] == 1)
          {
            filledCells++;
          }
      }
    }
    if (filledCells >= 70)
    {
      validMaze = true;
    }
    else
    {
      std::cout << "Regenerating maze..." << std::endl;
    }
  }

}