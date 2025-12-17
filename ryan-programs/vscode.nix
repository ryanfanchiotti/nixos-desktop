{ pkgs, ... }:

{
  # Visual Studio Code setup
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    # This property will be used to generate settings.json:
    # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
    profiles.default.userSettings = {
      diffEditor.ignoreTrimWhitespace = false;

      search.followSymlinks = false;

      extensions.ignoreRecommendations = true;
      extensions.autoUpdate = false;

      telemetry.telemetryLevel = "off";

      files.trimFinalNewLines = true;

      security.workspace.trust.untrustedFiles = "open";
      security.workspace.trust.enabled = false;

      debug.toolBarLocation = "commandCenter";

      git.openRepositoryInParentFolders = "never";

      terminal.integrated = {
        fontSize = 16;
        cursorBlinking = false;
        minimumContrastRatio = true;
        shellIntegration = {
          history = 0;
          enabled = false;
        };
        gpuAcceleration = "on";
        enablePersistentSessions = false;
      };

      breadcrumbs.enabled = false;

      editor = {
        smoothScrolling = false;
        cursorBlinking = "solid";
        bracketPairColorization = false;
        hover.delay = 50;
        inlayHints.enabled = "off";
        wordWrap = "on";
        fontSize = 16;
        fontFamily = "Monaspace Argon";
        cursorStyle = "line";
        folding = false;
        stickyScroll.enabled = false;
        renderLineHighlight = "none";
        minimap.enabled = false;
      };

      explorer = {
        decorations.colors = false;
        sortOrder = "type";
      };

      workbench = {
        editor.showIcons = false;
        editor.tabSizing = "shrink";
        statusBar.visible = false;
        tree.indent = 10;
        iconTheme = null;
        startupEditor = "none";
        settings.applyToAllProfiles = ["editor.fontSize"];
        colorTheme = "Solarized Light";
      };

      window.restoreWindows = "none";
      window.title = "\${activeFolderShort}";

      update.mode = "none";
    };

    # See https://code.visualstudio.com/docs/getstarted/keybindings#_advanced-customization
    profiles.default.keybindings = [
      {
          key = "shift+cmd+j";
          command = "workbench.action.focusActiveEditorGroup";
          when = "terminalFocus";
      }
    ];

    profiles.default.extensions = with pkgs.vscode-marketplace; [

    ];
  };
}
