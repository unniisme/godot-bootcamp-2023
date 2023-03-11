extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Start playing the default animation
	$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	if body.name == "Player":
		self.queue_free()
