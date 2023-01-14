extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AddTaskBtn_pressed():

	#var text = $TextTask.text
	var task = preload("res://Scens/Task.tscn").instance()

	#print (text)
	get_node("/root/main/TaskContainer").add_child(task)

	#pass # Replace with function body.
