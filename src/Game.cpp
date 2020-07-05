#include <iostream>
#include "./Constants.h"
#include "./Game.h"
#include "../lib/glm/glm.hpp"

// constructor
Game::Game() {
    this->isRunning = false;

}

// destructor
Game::~Game() {

}

bool Game::IsRunning() const {
    return this->isRunning;
}

glm::vec2 projectilePos = glm::vec2(0.0f, 0.0f);
glm::vec2 projectileVel = glm::vec2(20.0f, 20.0f);

void Game::Initialize(int width, int height) {
    if ( SDL_Init(SDL_INIT_EVERYTHING) != 0) {
        // if error
        std::cerr << "Error initializing SDL." << std::endl;
        return;
    }

    // create the window with SDL
    window = SDL_CreateWindow(
        NULL,
        SDL_WINDOWPOS_CENTERED, // let SDL figure out to position at center
        SDL_WINDOWPOS_CENTERED, // let SDL figure out to position at center
        width,
        height,
        SDL_WINDOW_BORDERLESS // flags -> many more available
    );

    if(!window) {
        std::cerr << "Error creating SDL window." << std::endl;
        return;
    }

    // index -1: get the default driver to render
    // flags 0: no flags to set
    renderer = SDL_CreateRenderer(window, -1, 0); 

    if(!renderer) {
        std::cerr << "Error creating Renderer." << std::endl;
        return;
    }

    isRunning = true;

    return;    
}

void Game::ProcessInput() {
    SDL_Event event;
    SDL_PollEvent(&event); // & reference

    switch (event.type) {
        case SDL_QUIT:
            isRunning = false;
            break;

        case SDL_KEYDOWN:
            if(event.key.keysym.sym == SDLK_ESCAPE) {
                isRunning = false;
                // why no break?
            }
        
        default:
            break;
    }
}

void Game::Update() {
    // Sleep the execution until we reach the target frame time in milliseconds
    int timeToWait = FRAME_TARGET_TIME - (SDL_GetTicks() - ticksLastFrame);

    // Only call delay if we are too fast to process this frame
    if (timeToWait > 0 && timeToWait <= FRAME_TARGET_TIME) {
        SDL_Delay(timeToWait);
    }

    // Delta time is the difference in ticks from last frame converted to seconds
    float deltaTime = (SDL_GetTicks() - ticksLastFrame) / 1000.0f; // we want seconds

    // Clamp deltaTime to a maximum value
    deltaTime = (deltaTime > 0.05f) ? 0.05f : deltaTime;

    ticksLastFrame = SDL_GetTicks();

    // Use deltaTime to update my game objects
    projectilePos = glm::vec2(
        projectilePos.x + projectileVel.x * deltaTime,
        projectilePos.y + projectileVel.y * deltaTime
    );
}

void Game::Render() {
    SDL_SetRenderDrawColor(renderer, 21, 21, 21, 255);
    SDL_RenderClear(renderer); // clear backbuffer

    // struct for a rectangle
    SDL_Rect projectile {
        (int) projectilePos.x,
        (int) projectilePos.y,
        10,
        10
    };

    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
    SDL_RenderFillRect(renderer, &projectile);


    // swap backbuffer with frontbuffer
    SDL_RenderPresent(renderer);

}

void Game::Destroy() {
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}