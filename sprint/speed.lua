local M = {}
-- Keep our contribution separate. Additive changes by RPGsystem and similar
-- mods are preserved, including changes made while sprint is enabled.
function M.remove(s)
  if s.character and s.character.valid and s.bonus then
    s.character.character_running_speed_modifier = s.character.character_running_speed_modifier - s.bonus
  end
  s.character, s.bonus = nil, nil
end
function M.update(player, s)
  M.remove(s)
  local c = player.character
  if not s.enabled or not c or not c.valid or player.vehicle or
      player.controller_type ~= defines.controllers.character then return end
  -- Measure the engine's actual speed response. This includes equipment,
  -- force bonuses, tiles, stickers and shooting rather than guessing a formula.
  local base = c.character_running_speed_modifier
  local speed = c.character_running_speed
  c.character_running_speed_modifier = base + 1
  local slope = c.character_running_speed - speed
  c.character_running_speed_modifier = base
  if slope > 1e-12 and speed > 0 then
    s.bonus = speed * (s.multiplier - 1) / slope
    s.character = c
    c.character_running_speed_modifier = base + s.bonus
  end
end
return M
