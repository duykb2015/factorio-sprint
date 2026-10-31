local speed = require("__sprint__/speed")
local function near(a,b,label) assert(math.abs(a-b)<1e-7,label..": "..a.." vs "..b) end
script.on_init(function()
 local surface=game.surfaces[1]
 surface.request_to_generate_chunks({0,0},2)
 surface.force_generate_chunk_requests()
 local c=surface.create_entity{name="character",position={0,0},force="player"}
 local p={character=c,controller_type=defines.controllers.character}
 local s={enabled=true,multiplier=4}
 c.character_running_speed_modifier=0.75
 game.forces.player.character_running_speed_modifier=0.3
 local baseline=c.character_running_speed
 speed.update(p,s)
 near(c.character_running_speed,baseline*4,"4x character and force bonuses")
 c.character_running_speed_modifier=c.character_running_speed_modifier+0.25
 speed.remove(s)
 near(c.character_running_speed_modifier,1,"external bonus preserved")
 local armor=c.get_inventory(defines.inventory.character_armor)
 armor.insert{name="power-armor-mk2",count=1}
 local grid=armor[1].grid
 grid.put{name="fusion-reactor-equipment"}
 local exo=grid.put{name="exoskeleton-equipment"}
 exo.energy=exo.max_energy
 local baseline=c.character_running_speed
 speed.update(p,s)
 near(c.character_running_speed,baseline*4,"4x equipment")
 s.multiplier=2
 speed.update(p,s)
 near(c.character_running_speed,baseline*2,"live multiplier")
 s.enabled=false
 speed.update(p,s)
 near(c.character_running_speed,baseline,"toggle off")
 near(c.character_running_speed_modifier,1,"restore modifier")
 s.enabled=true
 p.vehicle={}
 speed.update(p,s)
 near(c.character_running_speed,baseline,"vehicle excluded")
 p.vehicle=nil
 speed.update(p,s)
 c.destroy()
 speed.update({controller_type=defines.controllers.ghost},s)
 log("SPRINT TESTS PASSED")
end)


