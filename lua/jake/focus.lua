local status_ok, focus = pcall(require, "focus")
if not status_ok then
  return
end

focus.setup({})
