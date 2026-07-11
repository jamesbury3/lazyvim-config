return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- Disables the line length check in markdown files
          prepend_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml" },
        },
      },
    },
  },
}
