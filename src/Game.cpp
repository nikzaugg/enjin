#include <iostream>
#include "./Constants.h"
#include "./Game.h"

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

float projectilePosX = 0.0f;
float projectilePosY = 0.0f;
float projectileVelX = 0.1f;
float projectileVelY = 0.1f;

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
    // update entities of the screen etc.
    projectilePosX += projectileVelX;
    projectilePosY += projectileVelY;
}

void Game::Render() {
    SDL_SetRenderDrawColor(renderer, 21, 21, 21, 255);
    SDL_RenderClear(renderer); // clear backbuffer

    // struct for a rectangle
    SDL_Rect projectile {
        (int) projectilePosX,
        (int) projectilePosY,
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