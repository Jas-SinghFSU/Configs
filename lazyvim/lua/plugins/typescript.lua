return {
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx)
        require("ts-error-translator").translate_diagnostics(err, result, ctx)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
      end
    end,
  },
}
