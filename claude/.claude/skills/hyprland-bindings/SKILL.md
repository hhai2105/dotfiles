---
name: hyprland-bindings
description: This skill should be used when the user asks to "add a keybinding", "bind a key", "hyprland shortcut", "hyprland hotkey", "add a submap", "create a submap", "remove a binding", "change a keybinding", or mentions hyprland keybinds, binds, bindm, or binde. Provides guidance for adding and managing Hyprland configuration bindings.
version: 0.1.0
---

# Hyprland Keybinds

This skill covers adding and managing keybindings in the user's Hyprland configuration. The config is split across several sourced files — bindings go into `keybinds/`, not into the main `hyprland.conf`.

## File Structure

```
hypr/.config/hypr/
├── hyprland.conf              # Main config (sources keybind.conf)
├── keybind.conf               # Sources the keybinds/ files
└── keybinds/
    ├── window.conf            # Window movement, focus, workspace bindings
    └── programs.conf          # App launches, rofi submaps, media keys
```

## Binding Syntax

```
bind = MODIFIKEY, KEY, ACTION, ARGS

# Examples:
bind = SUPER, return, exec, ghostty
bind = SUPER SHIFT, w, movetoworkspace, 1
bindm = SUPER, mouse:272, movewindow
binde =, XF86AudioRaiseVolume, exec, pavolume.sh --up
```

### Modifier Patterns

| Pattern | Used For | Example |
|---|---|---|
| `SUPER,` | Core system actions | `SUPER, return` — terminal |
| `SUPER SHIFT,` | Disruptive/secondary actions | `SUPER SHIFT, w` — move to workspace |
| `CONTROL ALT,` | Application launches | `CONTROL ALT, w` — browser |
| `,` | Inside submaps (no mainMod) | `bind = , q, exec, sleep 1 && hyprctl dispatch dpms off` |

### Actions

| Action | Use |
|---|---|
| `exec` | Run a command/script |
| `submap` | Enter a submap (nested bindings) |
| `reset` | Reset a submap |
| `workspace` | Switch workspace |
| `movetoworkspace` | Move window to workspace |
| `movefocus` | Move focus (direction) |
| `togglefloating`, `fullscreenstate`, `killactive` | Window management |

## Submap Pattern

Submaps group related keys under a prefix. The user follows this exact pattern:

```conf
# Declare submap entry point
bind = SUPER, p, submap, superpsubmap

submap = superpsubmap
bind = , a, exec, ~/.scripts/rofi/soundcard-choose
bind = , a, submap, reset
bind = , q, exec, sleep 1 && hyprctl dispatch dpms off
bind = , q, submap, reset
bind = , o, exec, sleep 1 && hyprctl dispatch dpms on
bind = , o, submap, reset
bind = ,escape, submap, reset
submap = reset
```

Key rules:
- Each submap binding **must** have a matching `bind = , key, submap, reset` right after
- Use `,escape, submap, reset` for a catch-all escape (resets submap on any unrecognized key)
- Inside a submap, the modifier is omitted — `bind = , key, exec, ...`
- The `submap = reset` at the end resets to the main binding table

## Choosing a Key — Conflict Avoidance

1. Check `keybinds/programs.conf` and `keybinds/window.conf` for existing bindings using the same key or modifier combo
2. For `SUPER` bindings: avoid keys already used by workspace switching (1-9), focus movement (hjkl), or rofi submaps (p, o)
3. For submap keys: pick single keys that fit the submap's theme (the user's superpsubmap uses `a`, `p`, `q`, `o` — all single letters)
4. For `CONTROL ALT` app bindings: avoid w, e, d, m, g, p, s (already taken)

### Existing Key Mappings

**SUPER bindings** (window.conf):
- 1-9: workspace
- h/j/k/l: movefocus
- w/e: focusmonitor
- t: togglefloating
- f: fullscreen
- R (shift): reload

**SUPER SHIFT bindings**:
- 1-9: movetoworkspace
- w/e: movecurrentworkspacetomonitor
- q: killactive
- R: reload

**CONTROL ALT bindings** (programs.conf):
- w: browser, e: editor, d: obsidian, m: discord, g: steam, p: Bitwarden, s: stremio

**SUPER+P submap** (superpsubmap):
- a: soundcard-choose, p: switch-monitor, q: dpms off, o: dpms on, escape: reset

**SUPER+O submap** (searchsubmap):
- o: rofi search, m: quickmark, escape: reset

**Other**:
- Print: screenshot

## Adding a Binding — Procedure

1. Read the existing file (`keybinds/programs.conf` for app launches, `keybinds/window.conf` for window/workspace movement)
2. Check for key conflicts in that file
3. Pick an unused key in the same modifier group
4. Write the binding, following the file's formatting (spaces, indentation, comments)
5. If adding to a submap: include the `bind = , key, submap, reset` line immediately after

### Example: Adding a Simple Binding

In `programs.conf`:
```conf
bind = SUPER, l, exec, ~/.scripts/rofi/toggle-llm
bind = , l, submap, reset
```

### Example: Adding to a Submap

```conf
submap = superpsubmap
bind = , a, exec, ~/.scripts/rofi/soundcard-choose
bind = , a, submap, reset
bind = , l, exec, ~/.scripts/rofi/toggle-llm
bind = , l, submap, reset
submap = reset
```

## File Placement Rules

- App launches, rofi bindings, system toggles → `programs.conf`
- Window focus, workspace navigation, monitor movement → `window.conf`
- Media keys (XF86 keys) → `hyprland.conf` (already at the bottom of binds section)
- Screen lock → `programs.conf` (or wherever the user puts display-related bindings)

## Common Pitfalls

- Don't forget the `submap, reset` line — without it, the user gets stuck in the submap
- The `submap = reset` at the end of a submap block is required to reset the binding table
- Use `sleep 1 &&` for commands that might conflict with Hyprland (like dpms toggle)
- Submap bindings inside `submap = name` blocks must not include a modifier before the key
- Don't mix `bind = SUPER,` bindings inside a `submap =` block — use `, key, ...` instead

## Additional Resources

For the full list of binding keywords and actions, consult the Hyprland wiki: `https://wiki.hyprland.org/Configuring/Binds/`
