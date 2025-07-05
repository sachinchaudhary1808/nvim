{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    # mnw.url = "../../.";
    # If you're actually using this, change your input to this:
    mnw.url = "github:Gerg-L/mnw";
  };
  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }:
    {
      packages.x86_64-linux =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        {
          default = mnw.lib.wrap pkgs {
            neovim = pkgs.neovim-unwrapped;
            initLua = ''
              require('init')
            '';
            extraBinPath = with pkgs; [
              nodejs
              lua-language-server
              gopls
              xclip
              wl-clipboard
              fd
              rust-analyzer
              nodePackages.bash-language-server
              yaml-language-server
              python312Packages.python-lsp-server
              marksman
              # clang-tools

              #formatters
              black
              stylua # for none-ls
              prettierd
              # live-server
              pyright
              pylint

              #nix
              alejandra
              # statix
              deadnix
              nil
            ];

            plugins = {
              start = with pkgs.vimPlugins; [
                {
                  # "pname" and "version"
                  # or "name" is required

                  name = "direnv-nvim";

                  src = pkgs.fetchFromGitHub {
                    owner = "NotaShelf";
                    repo = "direnv.nvim";
                    rev = "4dfc8758a1deab45e37b7f3661e0fd3759d85788";
                    hash = "sha256-KqO8uDbVy4sVVZ6mHikuO+SWCzWr97ZuFRC8npOPJIE=";
                  };

                  # Plugins can have other plugins as dependencies
                  # this is mainly used in nixpkgs
                  # avoid it if possible
                  dependencies = [ ];
                }
                lazydev-nvim
                blink-copilot
                avante-nvim
                blink-cmp-avante
                copilot-lua
                lspkind-nvim
                blink-cmp
                nvim-ts-autotag
                ccc-nvim
                trouble-nvim
                fidget-nvim
                alpha-nvim
                oil-nvim
                neoformat
                none-ls-nvim
                auto-session
                bufferline-nvim
                dressing-nvim
                indent-blankline-nvim
                neocord
                nvim-treesitter-context
                lualine-nvim
                mini-pairs
                which-key-nvim
                markdown-preview-nvim
                nvim-web-devicons
                nvim-surround
                nvim-lspconfig
                friendly-snippets
                lspsaga-nvim
                flash-nvim
                gitsigns-nvim
                onedark-nvim
                dracula-nvim
                # onedark-nvim
                plenary-nvim
                tokyonight-nvim
                catppuccin-nvim
                # neodev-nvim
                luasnip
                telescope-nvim
                telescope-file-browser-nvim
                todo-comments-nvim
                # nvim-tree-lua
                telescope-fzf-native-nvim
                vim-tmux-navigator
                undotree
                sniprun
                vim-fugitive
                harpoon2
                rainbow-delimiters-nvim

                # debugging
                nvim-dap
                nvim-dap-python
                nvim-dap-ui

                # testing
                vim-test
              ];
              dev.myconfig = {
                pure = ./nvim;
                impure =
                  # This is a hack it should be a absolute path
                  # here it'll only work from this directory
                  "/' .. vim.uv.cwd()  .. '/nvim";
              };
            };
          };

          dev = self.packages.x86_64-linux.default.devMode;
        };
    };
}
