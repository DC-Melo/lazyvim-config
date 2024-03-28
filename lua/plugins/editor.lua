return {
  -- {
  --   "stevearc/aerial.nvim",
  --   event = "LazyFile",
  --   opts = function()
  --     local icons = vim.deepcopy(Config.icons.kinds)
  --
  --     -- HACK: fix lua's weird choice for `Package` for control
  --     -- structures like if/else/for/etc.
  --     icons.lua = { Package = icons.Control }
  --
  --     ---@type table<string, string[]>|false
  --     local filter_kind = false
  --     if Config.kind_filter then
  --       filter_kind = assert(vim.deepcopy(Config.kind_filter))
  --       filter_kind._ = filter_kind.default
  --       filter_kind.default = nil
  --     end
  --
  --     local opts = {
  --       attach_mode = "global",
  --       backends = { "lsp", "treesitter", "markdown", "man" },
  --       show_guides = true,
  --       layout = {
  --         resize_to_content = false,
  --         win_opts = {
  --           winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
  --           signcolumn = "yes",
  --           statuscolumn = " ",
  --         },
  --       },
  --       icons = icons,
  --       filter_kind = filter_kind,
  --     -- stylua: ignore
  --     guides = {
  --       mid_item   = "├╴",
  --       last_item  = "└╴",
  --       nested_top = "│ ",
  --       whitespace = "  ",
  --     },
  --     }
  --     return opts
  --   end,
  --   keys = {
  --     { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
  --   },
  -- },
  {
    "monaqa/dial.nvim",
  -- stylua: ignore
  keys = {
    { "<C-a>", function() return M.dial(true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
    { "<C-x>", function() return M.dial(false) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
    { "g<C-a>", function() return M.dial(true, true) end, expr = true, desc = "Increment", mode = {"n", "v"} },
    { "g<C-x>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = {"n", "v"} },
  },
    opts = function()
      local augend = require("dial.augend")

      local logical_alias = augend.constant.new({
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
      })

      local ordinal_numbers = augend.constant.new({
        -- elements through which we cycle. When we increment, we go down
        -- On decrement we go up
        elements = {
          "first",
          "second",
          "third",
          "fourth",
          "fifth",
          "sixth",
          "seventh",
          "eighth",
          "ninth",
          "tenth",
        },
        -- if true, it only matches strings with word boundary. firstDate wouldn't work for example
        word = false,
        -- do we cycle back and forth (tenth to first on increment, first to tenth on decrement).
        -- Otherwise nothing will happen when there are no further values
        cyclic = true,
      })

      local weekdays = augend.constant.new({
        elements = {
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
          "Sunday",
        },
        word = true,
        cyclic = true,
      })

      local months = augend.constant.new({
        elements = {
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December",
        },
        word = true,
        cyclic = true,
      })

      local capitalized_boolean = augend.constant.new({
        elements = {
          "True",
          "False",
        },
        word = true,
        cyclic = true,
      })

      return {
        dials_by_ft = {
          css = "css",
          javascript = "typescript",
          javascriptreact = "typescript",
          json = "json",
          lua = "lua",
          markdown = "markdown",
          python = "python",
          sass = "css",
          scss = "css",
          typescript = "typescript",
          typescriptreact = "typescript",
        },
        groups = {
          default = {
            augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
            augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
            augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
          },
          typescript = {
            augend.integer.alias.decimal, -- nonnegative and negative decimal number
            augend.constant.alias.bool, -- boolean value (true <-> false)
            logical_alias,
            augend.constant.new({ elements = { "let", "const" } }),
            ordinal_numbers,
            weekdays,
            months,
          },
          css = {
            augend.integer.alias.decimal, -- nonnegative and negative decimal number
            augend.hexcolor.new({
              case = "lower",
            }),
            augend.hexcolor.new({
              case = "upper",
            }),
          },
          markdown = {
            augend.misc.alias.markdown_header,
            ordinal_numbers,
            weekdays,
            months,
          },
          json = {
            augend.integer.alias.decimal, -- nonnegative and negative decimal number
            augend.semver.alias.semver, -- versioning (v1.1.2)
          },
          lua = {
            augend.integer.alias.decimal, -- nonnegative and negative decimal number
            augend.constant.alias.bool, -- boolean value (true <-> false)
            augend.constant.new({
              elements = { "and", "or" },
              word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
              cyclic = true, -- "or" is incremented into "and".
            }),
            ordinal_numbers,
            weekdays,
            months,
          },
          python = {
            augend.integer.alias.decimal, -- nonnegative and negative decimal number
            capitalized_boolean,
            logical_alias,
            ordinal_numbers,
            weekdays,
            months,
          },
        },
      }
    end,
    config = function(_, opts)
      require("dial.config").augends:register_group(opts.groups)
      M.dials_by_ft = opts.dials_by_ft
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = {
      {
        "<leader>H",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon to File 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon to File 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon to File 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon to File 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Harpoon to File 5",
      },
    },
  },
  {
    "ggandor/flit.nvim",
    enabled = true,
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}
