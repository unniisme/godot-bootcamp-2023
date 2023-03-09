extends CharacterBody2D

@export var g = 1000
@export var speed = 500
@export var jumpSpeed = 800

@onready var animatedSprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = speed*(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	
	velocity += delta*g*Vector2.DOWN
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= jumpSpeed

	move_and_slide()
	set_direction()
	animate()
	
	
func flip():
	animatedSprite.set_flip_h(not animatedSprite.is_flipped_h())
	animatedSprite.offset *= -1
	
# sets the player direction based on the input movement
func set_direction():
	if velocity.x < 0 and not animatedSprite.is_flipped_h(): 
		flip()
	elif velocity.x > 0 and animatedSprite.is_flipped_h(): 
		flip()
		

# animates the player
func animate():
	if is_on_floor():
		if velocity.x == 0 : 
			animatedSprite.play("idle")
		else : 
			animatedSprite.play("run")
	else : 
		animatedSprite.play("jump")

