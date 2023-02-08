extends Node


@export var g: float  = 6.674e-11

@onready var body := preload("res://scenes/body/body.tscn") 
@onready var system := get_tree().root.get_node('./system')


func generate_new_system():
	print("I've been fired")
