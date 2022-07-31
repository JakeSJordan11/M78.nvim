local status_ok, circles = pcall(require, "circles")
if not status_ok then
  return
end

circles.setup {
  -- lsp = false,
}
