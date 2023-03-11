extends PathFollow2D

var timer = 0
@export var speed = 100   # Speed of the enemy, controllable from inspector

func _ready():
	# Start the animation of the enemy
	$Enemy.get_node("AnimatedSprite2D").play("default")


func _physics_process(delta):
	# Update position of enemy
	set_progress(get_progress() + speed * delta)
	
