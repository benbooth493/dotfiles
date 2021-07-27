local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {
          "wbthomason/packer.nvim",
          event = "VimEnter"
        }

        use {
          "akinsho/nvim-bufferline.lua",
          after = "nvim-base16.lua"
        }

        use {
          "glepnir/galaxyline.nvim",
          after = "nvim-base16.lua",
          config = function()
           require "config.statusline"
          end
        }

        use {
          "siduck76/nvim-base16.lua",
          after = "packer.nvim",
          config = function()
            require "theme"
          end
        }

        use {
          "norcalli/nvim-colorizer.lua",
          event = "BufRead",
          config = function()
            require("config.others").colorizer()
          end
        }

        use {
          "nvim-treesitter/nvim-treesitter",
          event = "BufRead",
          config = function()
            require "config.treesitter"
          end
        }

        use {
          "nvim-treesitter/playground",
          after = "nvim-treesitter"
        }

        use {
          "kabouzeid/nvim-lspinstall",
          event = "BufRead"
        }

        use {
          "neovim/nvim-lspconfig",
          after = "nvim-lspinstall",
          config = function()
            require "config.lspconfig"
          end
        }

        use {
          "onsails/lspkind-nvim",
          event = "BufRead",
          config = function()
            require("config.others").lspkind()
          end
        }

        use {
          "hrsh7th/nvim-compe",
          event = "InsertEnter",
          config = function()
            require "config.compe"
          end,
          wants = "LuaSnip",
          requires = {
            {
              "L3MON4D3/LuaSnip",
              wants = "friendly-snippets",
              event = "InsertCharPre",
              config = function()
                require "config.luasnip"
              end
            },
            {
              "rafamadriz/friendly-snippets",
              event = "InsertCharPre"
            }
          }
        }

        use {
          "sbdchd/neoformat",
          cmd = "Neoformat"
        }

        use {
          "kyazdani42/nvim-tree.lua",
          cmd = "NvimTreeToggle",
          config = function()
            require "config.nvimtree"
          end
        }

        use {
          "kyazdani42/nvim-web-devicons",
          after = "nvim-base16.lua",
          config = function()
            require "config.icons"
          end
        }

        use { "nvim-lua/plenary.nvim" }
        use { "nvim-lua/popup.nvim" }

        use {
          "nvim-telescope/telescope.nvim",
          cmd = "Telescope",
          config = function()
            require "config.telescope"
          end
        }

        use {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
          cmd = "Telescope"
        }

        use {
          "nvim-telescope/telescope-github.nvim",
          after = "telescope.nvim",
          config = function()
            require('telescope').load_extension('gh')
          end
        }

        use {
          "lazytanuki/nvim-mapper",
          after = "telescope.nvim",
          config = function()
            require("nvim-mapper").setup{}
          end
        }

        use {
          "lewis6991/gitsigns.nvim",
          after = "plenary.nvim",
          config = function()
            require "config.gitsigns"
          end
        }

        use {
          "windwp/nvim-autopairs",
          after = "nvim-compe",
          config = function()
            require "config.autopairs"
          end
        }

        use {
          "andymass/vim-matchup",
          event = "CursorMoved"
        }

        use {
          "terrortylor/nvim-comment",
          cmd = "CommentToggle",
          config = function()
            require("config.others").comment()
          end
        }

        use {
          "tweekmonster/startuptime.vim",
          cmd = "StartupTime"
        }

        use {
          "Pocco81/AutoSave.nvim",
          config = function()
            require "config.autosave"
          end,
          cond = function()
            return vim.g.auto_save == true
          end
        }

        use {
          "Pocco81/TrueZen.nvim",
          cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus"
          },
          config = function()
            require "config.zenmode"
          end
        }

        use {
          "lukas-reineke/indent-blankline.nvim",
          event = "BufRead",
          setup = function()
            require("config.others").blankline()
          end
        }

        use {
          "aserowy/tmux.nvim",
          config = function()
            require("tmux").setup({
              navigation = {
                enable_default_keybindings = true,
              },
              resize = {
                enable_default_keybindings = true,
              }
            })
          end
        }

        use {
          'TimUntersberger/neogit',
          after = "plenary.nvim",
          event = "BufRead",
          config = function()
            require("config.neogit")
          end
        }

        use {
          "npxbr/glow.nvim",
          run = "GlowInstall"
        }

        use {
          "liuchengxu/vista.vim",
          config = function()
            vim.g.vista_default_executive = "nvim_lsp"
          end
        }

        use { "lambdalisue/gina.vim" }
    end
)
