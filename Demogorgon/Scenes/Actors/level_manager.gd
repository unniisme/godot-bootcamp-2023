extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Starting level")
	
	# For each enemy scene under Enemies (Path2D node)
	var all_enemies = get_parent().get_node("Enemies")
	# For each child of the enemy scene (PathFollow2D node)
	for i in all_enemies.get_children() :
		# Connect "body_entered" Signal from Enemy node (Area2D) to "_on_kiler_area_body_entered"
		var enemy_area = i.get_node("PathFollow2D/Enemy")
		enemy_area.body_entered.connect(_on_kiler_area_body_entered)



func _on_kiler_area_body_entered(body):
	# If player enters the body, reload scene
	if body.name == "Player":
		self.get_tree().reload_current_scene()
		
		print("Final score: ",  score)

func _on_money_body_entered(body):
	# If player enters the body, increase score
	if body.name == "Player":
		score += 1 

	
