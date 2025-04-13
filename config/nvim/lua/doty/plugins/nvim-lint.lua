require("lint").linters_by_ft = {
  ["*"] = { "codespell","gitlint", "staticcheck" ,"typos"},
  ansible = { "ansible_lint" },
  bash = { "bash", "shellcheck"},
  clojure = { "clj-kondo" },
  dockerfile = { "hadolint" },
  dotenv = { "dotenv_linter" },
  editorconfig = { "editorconfig-checker" },
  gitcommit = { "commitlint", },
  go = { "golangcilint" },
  inko = { "inko" },
  janet = { "janet" },
  jq = { "jq" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  make = { "checkmake" },
  markdown = { "vale" },
  python = { "ruff", "mypy" },
  rst = { "vale" },
  ruby = { "ruby" },
  rust = { "clippy" },
  sh = { "shellcheck"},
  terraform = { "tflint", "terraform_validate" },
  text = { "vale" },
  tf = { "terraform_validate","tflint","tfsec" },
  yaml = { "yamllint" },
  yq = { "yq" },
  zsh = { "zsh" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    local lint = require("lint")
    local names = lint._resolve_linter_by_ft(vim.bo.filetype)
    for _, linter in pairs(lint.linters_by_ft["*"]) do
      table.insert(names, linter)
    end

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint(names)
  end,
})
