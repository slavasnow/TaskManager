extends Node2D

# переменные для отслеживания тасков
const MAX_TASKS = 14 # константа кол-во тасков 
var _countTask = 0  # счетчик тасков
var _enableAdd = true # проверка соответвия 
var task # переменная для инстанса таска

#добавление таска 
func _create_new_task():
	var _text = $TextTask.text
	task = preload("res://Scens/Task.tscn").instance()#
	

	task.get_node("Label").text = _text
	get_node("TasksContainer").add_child(task)
	task.get_node("ControlNode").connect("counted", self, "_counted")

	$TextTask.text = ""
	_countTask += 1
	#

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

#событие удаления таска
func _counted():
	_countTask -= 1	

# Called when the node enters the scene tree for the first time.
#func _ready():	
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	_get_input()

	

	#постоянная проверка на максимальное кол-во тасков
	if _countTask == MAX_TASKS:
		_check_max_count(true)
	else:
		_check_max_count(false)

# нажатие на добавление таска с помощью кнопки
func _on_AddTaskBtn_pressed(): 
	_create_new_task()
