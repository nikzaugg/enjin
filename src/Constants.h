#ifndef CONSTANTS_H
#define CONSTANTS_H

const unsigned int WINDOW_WIDTH = 800;
const unsigned int WINDOW_HEIGHT = 600;

const unsigned int FPS = 60;
const unsigned int FRAME_TARGET_TIME = 1000 / FPS;

const int MOVEMENT_SPEED = 150;

enum LayerType
{
    TILEMAP_LAYER = 0,
    VEGETATION_LAYER = 1,
    ENEMY_LAYER = 2,
    PLAYER_LAYER = 3,
    PROJECTILES_LAYER = 4,
    UI_LAYER = 5
};

const unsigned int NUM_LAYERS = 6;

#endif
