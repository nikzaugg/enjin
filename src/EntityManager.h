#ifndef ENTITYMANAGER_H
#define ENTITYMANAGER_H

#include "./Entity.h"
#include "./Component.h"
#include <vector>

class EntityManager
{
private:
    std::vector<Entity *> entities;

public:
    void ClearData();
    void Update(float deltaTime);
    void Render();
    bool HasNoEntities();
    Entity &AddEntity(std::string entityName, LayerType layer);
    std::vector<Entity *> GetEntities() const;
    std::vector<Entity *> GetEntitiesByLayer(LayerType layer) const;
    Entity *GetEntityByName(std::string entityName) const;
    unsigned int GetEntityCount();
    void ListAllEntities() const;
    CollisionType CheckCollisions() const;
};

#endif
