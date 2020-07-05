#ifndef GAME_H
#define GAME_H

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>

class Game {
    private:
        bool isRunning; // defineds if game is running
        SDL_Window *window;
        SDL_Renderer *renderer;

    public:
        Game();
        ~Game();
        bool IsRunning() const; // const -> not going to change anything in the class
        void Initialize(int width, int height);
        void ProcessInput();
        void Update();
        void Render();
        void Destroy();
};

#endif