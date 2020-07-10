#ifndef COLLIDERCOMPONENT_H
#define COLLIDERCOMPONENT_H

#include <SDL2/SDL.h>
#include "../Game.h"
#include "../EntityManager.h"
#include "./TransformComponent.h"
#include "./SpriteComponent.h"

class ColliderComponent : public Component
{
public:
    std::string colliderTag;
    SDL_Rect collider;
    SDL_Rect sourceRectangle;
    SDL_Rect destinationRectangle;
    TransformComponent *transform;
    SDL_Texture *collisionTexture;
    bool showCollisionTexture = false;

    ColliderComponent(std::string colliderTag, int x, int y, int width, int height)
    {
        this->colliderTag = colliderTag;
        this->collider = {x, y, width, height};
    }

    void Initialize() override
    {
        if (owner->HasComponent<TransformComponent>())
        {
            transform = owner->GetComponent<TransformComponent>();
            sourceRectangle = {0, 0, transform->width, transform->height};
            destinationRectangle = {collider.x, collider.y, collider.w, collider.h};
            // TODO: make dynamic
            collisionTexture = Game::assetManager->GetTexture("collision-image");
        }
    }

    void Update(float deltaTime) override
    {
        collider.x = static_cast<int>(transform->position.x);
        collider.y = static_cast<int>(transform->position.y);
        collider.w = transform->width * transform->scale;
        collider.h = transform->height * transform->scale;

        destinationRectangle.x = collider.x - Game::camera.x;
        destinationRectangle.y = collider.y - Game::camera.y;
    }

    void Render() override
    {
        if (Game::event.type == SDL_KEYDOWN)
        {
            if (Game::event.key.keysym.sym == SDLK_c)
            {
                showCollisionTexture = !showCollisionTexture;
            }
        }

        if (showCollisionTexture)
        {
            TextureManager::Draw(collisionTexture, sourceRectangle, destinationRectangle, SDL_FLIP_NONE);
        }
    }
};

#endif