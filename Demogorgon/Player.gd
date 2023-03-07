extends CharacterBody2D

@export var g = 1000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity += delta*g*Vector2.DOWN

	move_and_slide()
