return {
  {
    "nvim-telescope/telescope.nvim",
    priority = 100,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "rcarriga/nvim-notify",
      "kdheepak/lazygit.nvim",
      "ahmedkhalf/project.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "crispgm/telescope-heading.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "ptethng/telescope-makefile",
    },
    config = function()
      require("doty.plugins.telescope")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    main = "project_nvim",
    config = function()
      require("doty.plugins.telescope-project")
    end,
  },
  "crispgm/telescope-heading.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "ptethng/telescope-makefile",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
    },
  },
  {
    "cappyzawa/telescope-terraform.nvim",
    ft = { "terraform", "hcl" },
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("terraform")
      end)
    end,
  },
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    ft = { "terraform", "hcl" },
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("terraform_doc")
      end)
    end,
  },
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
