-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/michaelhelvey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/michaelhelvey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/michaelhelvey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/michaelhelvey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/michaelhelvey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/colorbuddy.vim",
    url = "https://github.com/tjdevries/colorbuddy.vim"
  },
  edge = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gruber-darker-vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/gruber-darker-vim",
    url = "https://github.com/drsooch/gruber-darker-vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim",
    url = "https://github.com/tjdevries/gruvbuddy.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["naysayer88.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/naysayer88.vim",
    url = "https://github.com/michaelhelvey/naysayer88.vim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neotest = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["neotest-rust"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest-rust",
    url = "https://github.com/rouge8/neotest-rust"
  },
  ["neotest-vitest"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/neotest-vitest",
    url = "https://github.com/marilari88/neotest-vitest"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["night-owl.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/night-owl.vim",
    url = "https://github.com/haishanh/night-owl.vim"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-fzf",
    url = "https://github.com/vijaymarupudi/nvim-fzf"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-astro"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-astro",
    url = "https://github.com/wuelnerdotexe/vim-astro"
  },
  ["vim-buftabline"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-buftabline",
    url = "https://github.com/ap/vim-buftabline"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["zenburn.nvim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/phha/zenburn.nvim"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/Users/michaelhelvey/.local/share/nvim/site/pack/packer/start/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
