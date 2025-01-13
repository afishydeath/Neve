{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "${pkgs.cpplint}" ];
        cpp = [ "${pkgs.cpplint}" ];
        go = [ "${pkgs.golangci-lint}" ];
        nix = [ "${pkgs.statix}" ];
        lua = [ "${pkgs.selene}" ];
        python = [ "${pkgs.python312Packages.flake8}" ];
        javascript = [ "${pkgs.eslint_d}" ];
        javascriptreact = [ "${pkgs.eslint_d}" ];
        typescript = [ "${pkgs.eslint_d}" ];
        typescriptreact = [ "${pkgs.eslint_d}" ];
        json = [ "${pkgs.nodePackages.jsonlint}" ];
        java = [ "${pkgs.checkstyle}" ];
        haskell = [ "${pkgs.hlint}" ];
        bash = [ "${pkgs.shellcheck}" ];
      };
    };
  };
}
