-- if true then return {} end
return {
  {
    lazy = false,
    "sindrets/diffview.nvim",
  },
  {
    lazy = false,
    "mg979/vim-visual-multi",
  },
  {
    lazy = false,
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
}
