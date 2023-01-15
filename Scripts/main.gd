extends Node2D


func _create_new_task():
	var _text = $TextTask.text
	var task = preload("res://Scens/Task.tscn").instance()

	task.get_node("Label").text = _text
	get_node("TaskContainer").add_child(task)

	$TextTask.text = ""

# Управаление с помощью клавиш
func _get_input():
	# Добавление таска
	if Input.is_action_just_pressed("ui_accept"):
		_on_AddTaskBtn_pressed()

	
# Called when the node enters the scene tree for the first time.
#func _ready():	
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()
#	pass

func _on_AddTaskBtn_pressed():
	_create_new_task()

	#pass # Replace with function body.
