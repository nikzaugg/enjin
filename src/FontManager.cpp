#include "./FontManager.h"
#include "./Game.h"

TTF_Font *FontManager::LoadFont(const char *fileName, int fontSize)
{
    return TTF_OpenFont(fileName, fontSize);
}

void FontManager::Draw(SDL_Texture *texture, SDL_Rect position)
{
    // NULL: use all of the texture
    SDL_RenderCopy(Game::renderer, texture, NULL, &position);
}