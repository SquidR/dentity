local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/SquidR/Doors-Entites/main/Normal-AI.lua"))()
local glitch = false
local audio = Instance.new("Sound")
audio.Parent = workspace
audio.SoundId = 3619734707
audio.Volume = 1
audio.Looped = true
audio.Playing = true
audio.PlaybackSpeed = 0.7


-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "Glitcher", -- Custom name of your entity
    Model = "https://raw.githubusercontent.com/SquidR/Doors-Entites/main/Glitcher.rbxm", -- Can be GitHub file or rbxassetid
    Speed = 150, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BackwardsMovement = true,
    BreakLights = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 1, 0.1, 1}, -- Shake values (don't change if you don't know)
        25, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://11064780170", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                3359047385, -- SoundId
                { Volume = 1 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(0, 255, 0), -- Color
            },
            Tease = {
                false, -- Enabled/Disabled
                Min = 1,
                Max = 1,
            },
        },
    },
    CustomDialog = {}, -- Custom death message
})


-----[[  Debug -=- Advanced  ]]-----
entityTable.Debug.OnEntitySpawned = function()
    print("Entity has spawned:", entityTable)
    game.Lighting.Ambience_Glitch.Enabled = true
end

entityTable.Debug.OnEntityDespawned = function()
    print("Entity has despawned:", entityTable)
    game.Lighting.Ambience_Glitch.Enabled = false
end

entityTable.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:", entityTable)
end

entityTable.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:", entityTable)
end

entityTable.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entityTable, "has entered room:", room)
    if not glitch then
        glitch = true    
        game.Lighting.Ambience_Glitch.Enabled = true
    else
        glitch = false    
        game.Lighting.Ambience_Glitch.Enabled = false
    end
end

entityTable.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:", entityTable)
end

entityTable.Debug.OnDeath = function()
    warn("Player has died.")
    audio:Destroy()
end
------------------------------------


-- Run the created entity
Spawner.runEntity(entityTable)
