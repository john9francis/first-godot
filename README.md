# first-godot

This is my first Godot project. I am following the [dodge the creeps tutorial](https://docs.godotengine.org/en/stable/getting_started/first_2d_game).

# Progress
- 9/13 Got [this far](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/03.coding_the_player.html)
- 9/14 Just mapped the up right left down keys to move functionality
- 9/15 Next step, [Creating the enemy](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/04.creating_the_enemy.html)
- 9/18 Next step, [Create main menu](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/06.heads_up_display.html)
- 9/19 Next step, [Finishing up](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/07.finishing-up.html)

# Notes:
### Scenes vs. Nodes
A scene in Godot is any game object. A main menu, a player, a door, etc. Basically any object. A node is a child of a certain object. For example, a player's nodes might be their skin, their hitbox, their nametag, etc. 
### Signals
You can have a node emit a signal if something happens. For example, if the player touches a door, it can emit a signal for the game to shift into a different room. Or if a bullet hits the player, it emits a signal for the player to take damage. 
### Scripts
- _ready() is like 'onInitialize()'
- _process(delta) is like 'onUpdate()'

# Useful Links
- [Step by step (getting started guide)](https://docs.godotengine.org/en/stable/getting_started/step_by_step/index.html)
