extends Node2D

# переменные для отслеживания тасков
var _maxCountTask = 14
var _countTask = 0
var _enableAdd = true

#добавление таска 
func _create_new_task():
	var _text = $TextTask.text
	var task = preload("res://Scens/Task.tscn").instance()

	task.get_node("Label").text = _text
	get_node("TaskContainer").add_child(task)

	$TextTask.text = ""
	_countTask += 1
	#
	print(_countTask)

#проверка на кол-во тасков
func _check_max_count(check):
	if check == true: # если истина, то отключаем возможность писать с создавать
		$TextTask.editable = false
		$AddTaskBtn.disabled = true
		_enableAdd = false
	else: # иначе, если ложно, то включаем возможность
		$TextTask.editable = true
		$AddTaskBtn.disabled = false
		_enableAdd = true

# Управаление с помощью клавиш
func _get_input():
	# Добавление таска
	if Input.is_action_just_pressed("ui_accept") and _enableAdd == true:
		_on_AddTaskBtn_pressed()

	
# Called when the node enters the scene tree for the first time.
#func _ready():	
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	_get_input()

	#постоянная проверка на максимальное кол-во тасков
	if _countTask == _maxCountTask:
		_check_max_count(true)
	else:
		_check_max_count(false)

# нажатие на добавление таска с помощью кнопки
func _on_AddTaskBtn_pressed(): 
	_create_new_task()
