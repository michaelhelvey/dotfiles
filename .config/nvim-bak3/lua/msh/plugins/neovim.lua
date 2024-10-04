-- All the weird modern neovim (other than LSP) plugins that I have love/hate
-- relationship with. Bundled into a single file so that I can turn them all on
-- and off at once.
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["Z"] = "expand_all_nodes"
          }
        },
        close_if_last_window = true,
        default_component_configs = {
          indent = {
            expander_collapsed = "+",
            expander_expanded = "-"
          },
          git_status = {
            symbols = {
              deleted = "",
              renamed = "",
              modified = "",
              untracked = "",
              ignored = "",
              unstaged = "",
              staged = "",
              conflict = ""
            }
          }
        },
        filesystem = {
          follow_current_file = { enabled = true },
          components = {
            icon = function(config, node, state)
              if node.type == "file" or node.type == "directory" then
                return {}
              end
              return require("neo-tree.sources.common.components").icon(config,
                node, state)
            end
          }
        },
        buffers = {
          follow_current_file = { enabled = true }
        }
      })
      vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle<CR>', { desc = 'Open Neotree' })
      vim.keymap.set('n', '<leader>nf', '<Cmd>Neotree filesystem reveal<CR>',
        { desc = 'Open Neotree and reveal location' })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  { 'folke/trouble.nvim' },
}
