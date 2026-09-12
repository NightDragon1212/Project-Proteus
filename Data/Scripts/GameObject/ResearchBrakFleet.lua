require("PGBase")
require("PGStateMachine")
require("PGStoryMode")
require("PGSpawnUnits")

function Definitions()
    DebugMessage("%s -- In Definitions", tostring(Script))

    Define_State("State_Init", State_Init);
end


function State_Init(message)
    if message == OnEnter then
        if Get_Game_Mode() ~= "Galactic" then
            ScriptExit()
        end

        local owner = Object.Get_Owner()
        owner.Lock_Tech(Find_Object_Type("Rep_DHC","Victory_I_Frigate","Gladiator_I_Star_Destroyer","Victory_I_Star_Destroyer","Imperial_I_Star_Destroyer","Praetor_I_Battlecruiser"))
        owner.Unlock_Tech(Find_Object_Type("Modernized_DHC","Victory_II_Frigate","Gladiator_II_Star_Destroyer","Victory_II_Star_Destroyer","Imperial_II_Star_Destroyer","Praetor_II_Battlecruiser"))
        
        Object.Despawn()
        ScriptExit()
    end
end
