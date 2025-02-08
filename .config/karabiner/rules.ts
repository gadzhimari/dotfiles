import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, shell } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
    ],
  },
  ...createHyperSubLayers({
    // o = "Open" applications
    o: {
      1: app("1Password"),
      g: app("Google Chrome"),
      t: app("Ghostty"),
      m: app("Mail"),
      f: app("Finder"),
      v: app("Visual Studio Code"),
      z: open("raycast://extensions/raycast/zoom/start-meeting"),
    },
    // r = "Raycast"
    r: {
      h: open(
        "raycast://extensions/raycast/clipboard-history/clipboard-history"
      ),
      l: open("raycast://extensions/Visual-Studio-Coder/url-shortener"),
      m: open(
        "raycast://extensions/koinzhang/paste-as-plain-text/paste-as-plain-text?arguments=%7B%22advancedPasteFormat%22%3A%22Markdown%20Link%22%7D"
      ),
    },
    // v = "moVe" which isn't "m" because we want it to be on the left hand
    // so that hjkl work like they do in vim
    v: {
      h: {
        to: [{ key_code: "left_arrow" }],
      },
      j: {
        to: [{ key_code: "down_arrow" }],
      },
      k: {
        to: [{ key_code: "up_arrow" }],
      },
      l: {
        to: [{ key_code: "right_arrow" }],
      },
      u: {
        to: [{ key_code: "page_down" }],
      },
      i: {
        to: [{ key_code: "page_up" }],
      },
    },
    // w = "Window"
    w: {
      k: open("-g raycast://extensions/raycast/window-management/top-half"),
      j: open("-g raycast://extensions/raycast/window-management/bottom-half"),
      h: open("-g raycast://extensions/raycast/window-management/left-half"),
      l: open("-g raycast://extensions/raycast/window-management/right-half"),
      m: open("-g raycast://extensions/raycast/window-management/maximize"),
      f: open(
        "-g raycast://extensions/raycast/window-management/toggle-fullscreen"
      ),
    },
    c: {
      j: open(
        "raycast://extensions/Aayush9029/cleanshotx/capture-area?arguments=%7B%22action%22%3A%22%22%7D"
      ),
    },
  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          virtual_hid_keyboard: {
            keyboard_type_v2: "ansi",
          },
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
