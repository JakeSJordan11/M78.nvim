local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("jake.lsp.lsp-installer")
require("jake.lsp.handlers").setup()
