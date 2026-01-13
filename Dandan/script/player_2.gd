extends CharacterBody2D

var speed = 100

var player_state

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right","up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
		
