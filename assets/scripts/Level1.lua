----------------------------------------------------
-- Start the seed to be used with math.random
----------------------------------------------------
math.randomseed(os.time())

Level1 = {
    ----------------------------------------------------
    -- Table to define the list of assets
    ----------------------------------------------------
    assets = {
        [0] = { type="texture", id = "terrain-texture-day", file = "./assets/tilemaps/jungle.png" },
        [1] = { type="texture", id = "terrain-texture-night", file = "./assets/tilemaps/jungle-night.png" },
        [2] = { type="texture", id = "chopper-texture", file = "./assets/images/chopper-spritesheet.png" },
        [3] = { type="texture", id = "projectile-texture", file = "./assets/images/bullet-enemy.png" },
        [4] = { type="texture", id = "obstacles-texture", file = "./assets/images/obstacles.png" },
        [5] = { type="texture", id = "truck-left-texture", file = "./assets/images/truck-left.png" },
        [6] = { type="texture", id = "truck-right-texture", file = "./assets/images/truck-right.png" },
        [7] = { type="texture", id = "truck-down-texture", file = "./assets/images/truck-down.png" },
        [8] = { type="texture", id = "tank-big-down-texture", file = "./assets/images/tank-big-down.png" },
        [9] = { type="texture", id = "tank-big-left-texture", file = "./assets/images/tank-big-left.png" },
        [10] = { type="texture", id = "tank-big-right-texture", file = "./assets/images/tank-big-right.png" },
        [11] = { type="texture", id = "tank-small-left-texture", file = "./assets/images/tank-small-left.png" },
        [12] = { type="texture", id = "tank-small-right-texture", file = "./assets/images/tank-small-right.png" },
        [13] = { type="texture", id = "army-group-1-texture", file = "./assets/images/army-group-1.png" },
        [14] = { type="texture", id = "army-group-2-texture", file = "./assets/images/army-group-2.png" },
        [15] = { type="texture", id = "army-group-3-texture", file = "./assets/images/army-group-3.png" },
        [16] = { type="texture", id = "rock-big-1-texture", file = "./assets/images/rock-big-1.png" },
        [17] = { type="texture", id = "rock-big-2-texture", file = "./assets/images/rock-big-2.png" },
        [18] = { type="texture", id = "rock-big-3-texture", file = "./assets/images/rock-big-3.png" },
        [19] = { type="texture", id = "rock-big-4-texture", file = "./assets/images/rock-big-4.png" },
        [20] = { type="texture", id = "rock-small-1-texture", file = "./assets/images/rock-small-1.png" },
        [21] = { type="texture", id = "tree-small-1-texture", file = "./assets/images/tree-small-1.png" },
        [22] = { type="texture", id = "tree-small-2-texture", file = "./assets/images/tree-small-2.png" },
        [23] = { type="texture", id = "tree-small-3-texture", file = "./assets/images/tree-small-3.png" },
        [24] = { type="texture", id = "tree-small-4-texture", file = "./assets/images/tree-small-4.png" },
        [25] = { type="texture", id = "tree-small-5-texture", file = "./assets/images/tree-small-5.png" },
        [26] = { type="texture", id = "tree-small-6-texture", file = "./assets/images/tree-small-6.png" },
        [27] = { type="texture", id = "tree-small-7-texture", file = "./assets/images/tree-small-7.png" },
        [28] = { type="texture", id = "tree-small-8-texture", file = "./assets/images/tree-small-8.png" },
        [29] = { type="texture", id = "start-texture", file = "./assets/images/start.png" },
        [30] = { type="texture", id = "heliport-texture", file = "./assets/images/heliport.png" },
        [31] = { type="texture", id = "bullet-friendly-texture", file = "./assets/images/bullet-friendly.png" },
        [32] = { type="texture", id = "radar-texture", file = "./assets/images/radar.png" },
        [33] = { type="sound", id = "blades-sound", file = "./assets/sounds/blades.wav" },
        [33] = { type="font", id = "charriot-font", file = "./assets/fonts/charriot.ttf", fontSize = 14 }
    },

    ----------------------------------------------------
    -- table to define the map config variables
    ----------------------------------------------------
    map = {
        textureAssetId = "terrain-texture-day",
        file = "./assets/tilemaps/jungle.map",
        scale = 2,
        tileSize = 32,
        mapSizeX = 25,
        mapSizeY = 20
    },

    ----------------------------------------------------
    -- table to define entities and their components
    ----------------------------------------------------
    entities = {
        [0] = {
            name = "player",
            layer = 4,
            components = {
                transform = {
                    position = {
                        x = 240,
                        y = 106
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "chopper-texture",
                    animated = true,
                    frameCount = 2,
                    animationSpeed = 90,
                    hasDirections = true,
                    fixed = false
                },
                collider = {
                    tag = "PLAYER"
                },
                input = {
                    keyboard = {
                        up = "w",
                        left = "a",
                        down = "s",
                        right = "d",
                        shoot = "space"
                    }
                }
            }
        },
        [1] = {
            name = "start",
            layer = 3,
            components = {
                transform = {
                    position = {
                        x = 240,
                        y = 115
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "start-texture",
                    animated = false
                }
            }
        },
        [2] = {
            name = "heliport",
            layer = 3,
            components = {
                transform = {
                    position = {
                        x = 1395,
                        y = 495
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "heliport-texture",
                    animated = false
                },
                collider = {
                    tag = "LEVEL_COMPLETE"
                }
            }
        },
        [3] = {
            name = "tank1",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 650,
                        y = 405
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-big-left-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 300,
                    angle = 180,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [4] = {
            name = "tank2",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 660,
                        y = 535
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-big-down-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 300,
                    angle = 90,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [5] = {
            name = "tank3",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 470,
                        y = 390
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-small-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 400,
                    angle = 0,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [6] = {
            name = "tank4",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 203,
                        y = 1088
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-big-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 0,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [7] = {
            name = "tank5",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 115,
                        y = 760
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-small-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 0,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [8] = {
            name = "tank6",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 515,
                        y = 665
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-small-left-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 180,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [9] = {
            name = "tank7",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 920,
                        y = 160
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-big-down-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 90,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [10] = {
            name = "tank8",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 1120,
                        y = 525
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tank-small-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 0,

                    textureAssetId = "projectile-texture"
                }
            }
        },
        [11] = {
            name = "truck1",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 243,
                        y = 497
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 1000,
                    angle = 270,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [12] = {
            name = "truck2",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 111,
                        y = 993
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-down-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 90,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [13] = {
            name = "truck3",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 760,
                        y = 200
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-left-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 180,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [14] = {
            name = "truck4",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 1361,
                        y = 222
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-down-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 90,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [15] = {
            name = "truck5",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 1220,
                        y = 760
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 270,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [16] = {
            name = "truck6",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 1170,
                        y = 790
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "truck-right-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 500,
                    angle = 270,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [17] = {
            name = "army1",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 460,
                        y = 445
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "army-group-1-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 1000,
                    angle = 225,
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [18] = {
            name = "army2",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 645,
                        y = 787
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "army-group-2-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 1000,
                    angle = math.random(360),
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [19] = {
            name = "army3",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 645,
                        y = 740
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "army-group-1-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 1000,
                    angle = math.random(360),
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [20] = {
            name = "army4",
            layer = 2,
            components = {
                transform = {
                    position = {
                        x = 881,
                        y = 482
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 32,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "army-group-3-texture",
                    animated = false
                },
                collider = {
                    tag = "ENEMY"
                },
                projectileEmitter = {
                    speed = 70,
                    range = 1000,
                    angle = math.random(360),
                    width = 4,
                    height = 4,
                    shouldLoop = true,
                    textureAssetId = "projectile-texture"
                }
            }
        },
        [21] = {
            name = "tree1",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 700,
                        y = 380
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [22] = {
            name = "tree2",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 680,
                        y = 365
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [23] = {
            name = "tree3",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 200,
                        y = 480
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [24] = {
            name = "tree4",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 310,
                        y = 490
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 18,
                    height = 22,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-4-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [25] = {
            name = "tree5",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 295,
                        y = 495
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 18,
                    height = 22,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-4-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [26] = {
            name = "tree6",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 370,
                        y = 480
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 18,
                    height = 22,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-4-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [27] = {
            name = "tree7",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 214,
                        y = 982
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [28] = {
            name = "tree8",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 182,
                        y = 943
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [29] = {
            name = "tree9",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 86,
                        y = 1064
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [30] = {
            name = "tree10",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 171,
                        y = 492
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-8-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [31] = {
            name = "tree11",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1020,
                        y = 103
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-8-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [32] = {
            name = "tree12",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1117,
                        y = 100
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [33] = {
            name = "tree13",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1130,
                        y = 115
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [34] = {
            name = "tree14",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1270,
                        y = 190
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [35] = {
            name = "tree15",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1280,
                        y = 205
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [36] = {
            name = "tree16",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1060,
                        y = 745
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [37] = {
            name = "tree17",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1075,
                        y = 760
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [38] = {
            name = "tree18",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1090,
                        y = 760
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-6-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [39] = {
            name = "tree19",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1285,
                        y = 173
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-7-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [40] = {
            name = "tree20",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 1036,
                        y = 93
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 32,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "tree-small-8-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [41] = {
            name = "rock1",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 360,
                        y = 450
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 24,
                    height = 24,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-big-2-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [42] = {
            name = "rock2",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 450,
                        y = 380
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 16,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-small-1-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [43] = {
            name = "rock3",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 435,
                        y = 400
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 16,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-small-1-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [44] = {
            name = "rock4",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 115,
                        y = 637
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 16,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-small-1-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [45] = {
            name = "rock5",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 124,
                        y = 660
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 16,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-small-1-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [46] = {
            name = "rock6",
            layer = 1,
            components = {
                transform = {
                    position = {
                        x = 116,
                        y = 827
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 16,
                    height = 16,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "rock-small-1-texture",
                    animated = false
                },
                collider = {
                    tag = "VEGETATION"
                }
            }
        },
        [47] = {
            name = "radar",
            layer = 6,
            components = {
                transform = {
                    position = {
                        x = 720,
                        y = 15
                    },
                    velocity = {
                        x = 0,
                        y = 0
                    },
                    width = 64,
                    height = 64,
                    scale = 1,
                    rotation = 0
                },
                sprite = {
                    textureAssetId = "radar-texture",
                    animated = true,
                    frameCount = 8,
                    animationSpeed = 150,
                    hasDirections = false,
                    fixed = true
                }
            }
        }
    }
}