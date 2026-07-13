let
  inlayHints = {
    includeInlayParameterNameHints = "all";
    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
    includeInlayFunctionParameterTypeHints = true;
    includeInlayVariableTypeHints = true;
    includeInlayPropertyDeclarationTypeHints = true;
    includeInlayFunctionLikeReturnTypeHints = true;
    includeInlayEnumMemberValueHints = true;
  };
in
{
  plugins.lsp.servers.ts_ls = {
    enable = true;

    settings = {
      javascript.inlayHints = inlayHints;
      typescript.inlayHints = inlayHints;
    };
  };
}
