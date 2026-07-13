let
  keys = import ../lib/keys.nix;
in
{
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          preset = "none";

          "${keys.ctrl "space"}" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];

          "${keys.ctrl "e"}" = [
            "accept"
            "fallback"
          ];

          "${keys.shift (keys.tab)}" = [
            "select_prev"
            "fallback"
          ];

          "${keys.tab}" = [
            "select_next"
            "fallback"
          ];

          "${keys.ctrl "b"}" = [
            "scroll_documentation_up"
            "fallback"
          ];

          "${keys.ctrl "f"}" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };

        appearance.nerd_font_variant = "mono";

        completion.documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "lazydev"
          ];

          providers.lazydev = {
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };

        snippets.preset = "luasnip";
        fuzzy.implementation = "lua";
        signature.enabled = true;
      };
    };

    luasnip.enable = true;
    friendly-snippets.enable = true;
    lazydev = {
      enable = true;

      # Lua tooling for Neovim runtime APIs.
      settings.library = [
        {
          # load luv types when code references `vim.uv`;
          path = "\${3rd}/luv/library";
          words = [ "vim%.uv" ];
        }
      ];
    };
  };

  extraConfigLua = ''
    require("luasnip.loaders.from_vscode").lazy_load()
  '';
}
