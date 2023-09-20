extends CanvasLayer

# notifies main that the start button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func show_message(text):
	# takes in text and puts it in the message node
	
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	# Show game over and then show the startup screen again
	
	show_message("Game Over")
	# Wait for message timer
	await $MessageTimer.timeout
	
	# reset message
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	# Delay a minute before displaying start button
	# our strategy here is creating a temporary timer
	# instead of dedicating a whole node to it
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
