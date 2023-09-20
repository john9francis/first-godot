extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	# update hud
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	$HUD.show_game_over()


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
	score += 1
	
	$HUD.update_score(score)


func _on_mob_timer_timeout():
	# ADD RANDOM MOB TO MOB SCENE
	# Create a new mob scene
	var mob = mob_scene.instantiate()
	
	# Spawn it in a random location on the path
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# Set the mob's direction perpendicular to the path direction
	var direction = mob_spawn_location.rotation + PI / 2
	
	# Set the mob's position to a random location
	mob.position = mob_spawn_location.position
	
	# Randomize direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# set mobs velocity
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# add mob to the main scene
	add_child(mob)
	
