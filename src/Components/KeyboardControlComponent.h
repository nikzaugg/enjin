#ifndef KEYBOARDCONTROLCOMPONENT_H
#define KEYBOARDCONTROLCOMPONENT_H

#include "../Game.h"
#include "../EntityManager.h"
#include "../Constants.h"
#include "TransformComponent.h"
#include "SpriteComponent.h"

class KeyboardControlComponent : public Component
{
public:
    std::string upKey;
    std::string rightKey;
    std::string downKey;
    std::string leftKey;
    std::string shootKey;
    TransformComponent *transform;
    SpriteComponent *sprite;

    KeyboardControlComponent()
    {
    }

    KeyboardControlComponent(std::string upKey, std::string rightKey, std::string downKey, std::string leftKey, std::string shootKey)
    {
        this->upKey = GetSDLKeyStringCode(upKey);
        this->rightKey = GetSDLKeyStringCode(rightKey);
        this->downKey = GetSDLKeyStringCode(downKey);
        this->leftKey = GetSDLKeyStringCode(leftKey);
        this->shootKey = GetSDLKeyStringCode(shootKey);
    }

    std::string GetSDLKeyStringCode(std::string key)
    {
        if (key.compare("up") == 0)
            return "1073741906";
        if (key.compare("down") == 0)
            return "1073741905";
        if (key.compare("left") == 0)
            return "1073741904";
        if (key.compare("right") == 0)
            return "1073741903";
        if (key.compare("space") == 0)
            return "32";
        return std::to_string(static_cast<int>(key[0]));
    }

    bool CheckIfInsideWindow() const
    {
        unsigned int SPRITE_WIDTH = 32; // TODO: make this dynamic

        // check right of screen
        if (transform->position.x + SPRITE_WIDTH >= WINDOW_WIDTH)
        {
            transform->position.x = WINDOW_WIDTH - SPRITE_WIDTH;
        }
        // check left of screen
        if (transform->position.x <= 0)
        {
            transform->position.x = 0;
        }
        // check bottom of screen
        if (transform->position.y + SPRITE_WIDTH >= WINDOW_HEIGHT)
        {
            transform->position.y = WINDOW_HEIGHT - SPRITE_WIDTH;
        }
        // check top of screen
        if (transform->position.y <= 0)
        {
            transform->position.y = 0;
        }
    }

    void Initialize() override
    {
        transform = owner->GetComponent<TransformComponent>();
        sprite = owner->GetComponent<SpriteComponent>();
    }

    void Update(float deltaTime) override
    {
        if (Game::event.type == SDL_KEYDOWN)
        {
            std::string keyCode = std::to_string(Game::event.key.keysym.sym);

            if (keyCode.compare(upKey) == 0)
            {
                CheckIfInsideWindow();
                transform->velocity.y = -MOVEMENT_SPEED;
                transform->velocity.x = 0;
                sprite->Play("UpAnimation");
            }
            if (keyCode.compare(rightKey) == 0)
            {
                CheckIfInsideWindow();
                transform->velocity.x = MOVEMENT_SPEED;
                transform->velocity.y = 0;
                sprite->Play("RightAnimation");
            }
            if (keyCode.compare(downKey) == 0)
            {
                CheckIfInsideWindow();
                transform->velocity.y = MOVEMENT_SPEED;
                transform->velocity.x = 0;
                sprite->Play("DownAnimation");
            }
            if (keyCode.compare(leftKey) == 0)
            {
                CheckIfInsideWindow();
                transform->velocity.x = -MOVEMENT_SPEED;
                transform->velocity.y = 0;
                sprite->Play("LeftAnimation");
            }
            if (keyCode.compare(shootKey) == 0)
            {
                // TODO:...
                // shoot projectiles
            }
        }

        if (Game::event.type == SDL_KEYUP)
        {
            std::string keyCode = std::to_string(Game::event.key.keysym.sym);

            if (keyCode.compare(upKey) == 0)
            {
                transform->velocity.y = 0;
            }
            if (keyCode.compare(rightKey) == 0)
            {
                transform->velocity.x = 0;
            }
            if (keyCode.compare(downKey) == 0)
            {
                transform->velocity.y = 0;
            }
            if (keyCode.compare(leftKey) == 0)
            {
                transform->velocity.x = 0;
            }
            if (keyCode.compare(shootKey) == 0)
            {
                // TODO:...
            }
        }
    }
};

#endif