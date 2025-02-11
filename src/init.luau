local RunService = game:GetService("RunService")
<<<<<<< HEAD

local clientActor = require("@src/initialization/clientActor")
local serverActor = require("@src/initialization/serverActor")
local clientSerial = require("@src/initialization/clientSerial")
local serverSerial = require("@src/initialization/serverSerial")
=======
--
local Client = require(script.Client)
local PublicTypes = require(script.PublicTypes)
local Server = require(script.Server)
local MockBridge = require(script.Studio.MockBridge)
local NetworkUtils = require(script.Utilities.NetworkUtils)
local Output = require(script.Utilities.Output)
local isEditMode = require(script.Utilities.isEditMode)
local version = require(script.version)
>>>>>>> 2821cc0 (	modified:   sourcemap.json)

local threadContext: "actor" | "serial" = if script:GetActor() ~= nil then "actor" else "serial"
local runContext: "server" | "client" = if RunService:IsServer() then "server" else "client"

if threadContext == "actor" and runContext == "client" then
	clientActor()
elseif threadContext == "actor" and runContext == "server" then
	serverActor()
elseif threadContext == "serial" and runContext == "client" then
	clientSerial()
elseif threadContext == "serial" and runContext == "server" then
	serverSerial()
end

return {}
