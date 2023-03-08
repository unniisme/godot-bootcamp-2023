extends CharacterBody2D

@export var g = 1000
@export var speed = 500
@export var jumpSpeed = 800
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = speed*(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	
	velocity += delta*g*Vector2.DOWN
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= jumpSpeed

	move_and_slide()
