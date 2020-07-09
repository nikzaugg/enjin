#include "AssetManager.h"

AssetManager::AssetManager(EntityManager *manager) : manager(manager)
{
}

void AssetManager::ClearData()
{
    textures.clear();
    fonts.clear();
}

void AssetManager::AddTexture(std::string textureId, const char *fileName)
{
    textures.emplace(textureId, TextureManager::LoadTexture(fileName));
}

void AssetManager::AddFont(std::string fontId, const char *fileName, int fontSize)
{
    fonts.emplace(fontId, FontManager::LoadFont(fileName, fontSize));
}

SDL_Texture *AssetManager::GetTexture(std::string textureId)
{
    return textures[textureId];
}

TTF_Font *AssetManager::GetFont(std::string fontId)
{
    return fonts[fontId];
}