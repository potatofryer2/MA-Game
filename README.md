# 3D Fighter Roguelike

A Godot 4.7 project organized to keep gameplay scenes, code, reusable data, and raw assets easy to find as the game grows.

## Project layout

```text
assets/                 Imported source art and audio, organized by asset type
  animations/            Animation files
  audio/
	music/               Music tracks
	sfx/                 Sound effects
  materials/             Shared materials
  models/
	characters/          Character model source/imports
	environments/        Environment model source/imports
  textures/              Texture images

data/                   Static game data intended for loading or lookup
resources/              Godot Resource files used as reusable game definitions
  attacks/               Attack and move definitions
  characters/            Player and character configuration
  enemies/               Enemy definitions
  items/                 Items, upgrades, and drops
  levels/                Level, encounter, and room configuration
scenes/                 Composable Godot scenes (.tscn)
  characters/
	player/              Player scenes (player.tscn is the capsule prototype)
	enemies/             Enemy scenes
  levels/                Arenas, rooms, and complete level scenes
  props/                 Interactive and decorative world objects
  ui/                    HUD, menus, and other interface scenes
scripts/                 GDScript source files (.gd)
  characters/            Player and enemy behavior
  combat/                Combat, hit detection, and move logic
  roguelike/             Runs, rooms, rewards, and progression
  systems/               Shared game systems and managers
  ui/                    UI behavior
```

Godot project files live at the repository root, including `project.godot` and `icon.svg`. The `.godot/` directory is generated editor/import data; do not put source files there.

## Where files belong

- Put each reusable visual or gameplay object in its own scene under `scenes/`. Use `scenes/characters/player/` for player scene variants and `scenes/characters/enemies/` for enemy scenes.
- Keep scripts in `scripts/`, grouped by the gameplay area they implement. Name scripts after their primary class or scene, such as `player_controller.gd`.
- Attach a scene-specific script beside its scene when that keeps the pair clear; otherwise keep scripts in the matching `scripts/` subfolder. Prefer one consistent location per feature and use clear names.
- Put reusable, designer-tunable Godot `.tres` definitions in `resources/`. For example, an attack definition belongs in `resources/attacks/`, while code that executes attacks belongs in `scripts/combat/`.
- Put original/imported art and audio in `assets/`, organized by type and then subject. Keep scene and resource references pointing to files in `assets/` rather than duplicating imported content.
- Use `data/` for static tables or external data files (for example JSON or CSV) that are loaded as data. If data needs Godot resource behavior, serialization, or inspector editing, use `resources/` instead.
- Keep related variants together and use descriptive `snake_case` filenames, such as `training_arena.tscn`, `heavy_strike.tres`, and `dojo_ambience.ogg`.

## Adding a new feature

1. Add its scene under the matching `scenes/` category.
2. Add behavior under the matching `scripts/` category, or beside the scene if it is tightly coupled.
3. Add reusable definitions under `resources/` and source art/audio under `assets/`.
4. Update this layout when introducing a new top-level folder or a new category used by multiple features.

Empty directories use `.gitkeep` markers so they remain present in version control. Remove a marker when its directory receives real files if desired.
