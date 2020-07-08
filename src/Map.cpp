#include <fstream>
#include "./Game.h"
#include "Map.h"
#include "EntityManager.h"
#include "./Components/TileComponent.h"

extern EntityManager manager;

Map::Map(std::string textureId, int scale, int tileSize)
{
    this->textureId = textureId;
    this->scale = scale;
    this->tileSize = tileSize;
}

void Map::LoadMap(std::string filePath, int mapSizeX, int mapSizeY)
{
    std::fstream mapFile;
    mapFile.open(filePath);

    // loop over columns and rows in the .map file
    // each row has numbers with comma delimiter
    // we read the two digits -> 1st: row, 2nd: column
    for (size_t y = 0; y < mapSizeY; y++)
    {
        for (size_t x = 0; x < mapSizeX; x++)
        {
            char ch;
            mapFile.get(ch);
            int sourceRectY = atoi(&ch) * tileSize;
            mapFile.get(ch);
            int sourceRectX = atoi(&ch) * tileSize;
            AddTile(sourceRectX, sourceRectY, x * (scale * tileSize), y * (scale * tileSize));
            mapFile.ignore();
        }
    }

    mapFile.close();
}

void Map::AddTile(int sourceRectX, int sourceRectY, int x, int y)
{
    Entity &newTile(manager.AddEntity("Tile", TILEMAP_LAYER));
    newTile.AddComponent<TileComponent>(sourceRectX, sourceRectY, x, y, tileSize, scale, textureId);
}
