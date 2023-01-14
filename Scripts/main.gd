extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AddTaskBtn_pressed():
	var _text = $TextTask.text
	var task = preload("res://Scens/Task.tscn").instance()

	task.get_node("Label").text = _text
	get_node("TaskContainer").add_child(task)

	$TextTask.text = ""

	pass # Replace with function body.
