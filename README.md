# Atlas

## Project Organization

This project utilizes the following organizational structure to maintain a good "at a glance" view of what each file's purpose is.

```
/project.godot  # Godot project file
/assets         # For all game assets
    /sprites    # For sprites
    /music      # Background music
    /sfx        # Sound effects
/nodes          # Nodes to be instanciated 
    /player
        player.gd
        player.tscn
/scenes         # Game scenes
    /main_menu  # Main menu scene and its specific assets/scripts
        main_menu.tscn
        main_menu.gd
    /guild      # Guild scene and its specific assets/scripts
        guild.tscn
        guild.gd
/scripts        # Global scripts not specific to any scene
    global.gd   # For scene switching, game states, etc.
/docs           # Documentation, notes, etc.
    .gdignore   # Ignore this folder for the project
```