local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/SquidR/Doors-Entites/main/Normal-AI.lua"))()

		-- Create entity
    		local meow = Instance.new("Sound")
    		meow.AudioId = 'rbxassetid://1091083826'
    		meow.Volume = 1

		local entityTable = Spawner.createEntity({
			CustomName = "Maxwell", -- Custom name of your entity
			Model = "https://raw.githubusercontent.com/SquidR/Doors-Entites/main/Maxwell.rbxm", -- Can be GitHub file or rbxassetid
			Speed = 60, -- Percentage, 100 = default Rush speed
			DelayTime = 0, -- Time before starting cycles (seconds)
			HeightOffset = 4,
			CanKill = false,
			KillRange = 0,
			BackwardsMovement = false,
			BreakLights = false,
			FlickerLights = {
				false, -- Enabled/Disabled
				1, -- Time (seconds)
			},
			Cycles = {
				Min = 3,
				Max = 10,
				WaitTime = 0,																																												
			},																			 
			CamShake = {
				false, -- Enabled/Disabled
				{3, 25, 1, 2}, -- Shake values {shake time, shake intensity, shake delay, shake rotation}]
				1000, -- Shake start distance (from Entity to you)
			},
			Jumpscare = {
				true, -- Enabled/Disabled
				{
					Image1 = "rbxassetid://11689830019", -- Image1 url
					Image2 = "rbxassetid://11689830019", -- Image2 url
					Shake = true,
					Sound1 = {
						10483790459, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Sound2 = {
						9125714014, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Flashing = {
						true, -- Enabled/Disabled
						Color3.fromRGB(255, 0, 0), -- Color
					},
					Tease = {
						false, -- Enabled/Disabled
						Min = 1,
						Max = 3,
					},
				},
			},
			CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
		})


		-----[[  Debug -=- Advanced  ]]-----
		entityTable.Debug.OnEntitySpawned = function()
			print("Entity has spawned:", entityTable)
			deathaudi:Play()
		end

		entityTable.Debug.OnEntityDespawned = function()
			print("Entity has despawned:", entityTable)
			deathaudi:Destroy()
		end

		entityTable.Debug.OnEntityStartMoving = function()
			print("Entity has started moving:", entityTable)
		end

		entityTable.Debug.OnEntityFinishedRebound = function()
			print("Entity has finished rebound:", entityTable)
		end

		entityTable.Debug.OnEntityEnteredRoom = function(room)
			print("Entity:", entityTable, "has entered room:", room)
      			meow:Play()
		end

		entityTable.Debug.OnLookAtEntity = function()
			print("Player has looked at entity:", entityTable)
		end

		entityTable.Debug.OnDeath = function()
			warn("Player has died.")
		end
		------------------------------------


		-- Run the created entity
		Spawner.runEntity(entityTable)
