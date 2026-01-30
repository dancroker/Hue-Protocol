#pragma once
#include <iostream>
class MapGrid
{
	public:
	MapGrid(int width, int height);
	~MapGrid();
	void setCellValue(int x, int y, int value);
	int getCellValue(int x, int y) ;
	int getWidth() ;
	int getHeight() ;
    float getCellSize() ;
    void printGrid();
    void createMaze(int option);

   private:
    int grid[10][10];
};
