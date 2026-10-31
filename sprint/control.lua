local speed = require("speed")
local function state(p)
  storage.players = storage.players or {}
  storage.players[p.index] = storage.players[p.index] or {enabled=false, multiplier=4}
  return storage.players[p.index]
end
local function gui(p)
  local s = state(p)
  local root = p.gui.top.sprint_root
  if not root then
    root = p.gui.top.add{type="flow", name="sprint_root", direction="vertical"}
    root.add{type="button", name="sprint_button", tooltip={"sprint.hint"}}
    local controls = root.add{type="flow", name="sprint_controls", direction="horizontal"}
    controls.visible = false
    controls.add{type="label", caption={"sprint.multiplier"}}
    controls.add{type="textfield", name="sprint_value", text=tostring(s.multiplier), numeric=true, allow_decimal=true, allow_negative=false}.style.width=70
    controls.add{type="button", name="sprint_apply", caption={"sprint.apply"}}
  end
  root.sprint_button.caption = {"sprint.toggle", {s.enabled and "sprint.on" or "sprint.off"}}
  root.sprint_button.toggled = s.enabled
end
local function toggle(p)
  local s = state(p)
  s.enabled = not s.enabled
  speed.update(p,s)
  gui(p)
end
script.on_init(function() for _,p in pairs(game.players) do gui(p) end end)
script.on_configuration_changed(function() for _,p in pairs(game.players) do gui(p) end end)
script.on_event({defines.events.on_player_created,defines.events.on_player_joined_game},function(e) gui(game.get_player(e.player_index)) end)
script.on_event("sprint-toggle-ctrl",function(e) toggle(game.get_player(e.player_index)) end)
script.on_event(defines.events.on_gui_click,function(e)
  if not e.element or not e.element.valid then return end
  local p = game.get_player(e.player_index)
  if e.element.name == "sprint_button" then
    if e.button == defines.mouse_button_type.right then
      local panel = p.gui.top.sprint_root.sprint_controls
      panel.visible = not panel.visible
    else toggle(p) end
  elseif e.element.name == "sprint_apply" then
    local value = tonumber(p.gui.top.sprint_root.sprint_controls.sprint_value.text)
    if not value or value ~= value or value < 1 or value > 100 then p.print({"sprint.invalid"}); return end
    local s = state(p)
    s.multiplier = value
    speed.update(p,s)
  end
end)
script.on_event(defines.events.on_tick,function()
  for _,p in pairs(game.connected_players) do speed.update(p,state(p)) end
end)
script.on_event(defines.events.on_pre_player_left_game,function(e) speed.remove(state(game.get_player(e.player_index))) end)
script.on_event(defines.events.on_player_removed,function(e)
  local s = storage.players and storage.players[e.player_index]
  if s then speed.remove(s); storage.players[e.player_index]=nil end
end)

