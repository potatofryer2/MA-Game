extends Node3D

const PLAYER_SCENE: PackedScene = preload("res://scenes/characters/player/player.tscn")

@onready var spawn_point: Marker3D = $PlayerSpawn

func _ready() -> void:
	var player := PLAYER_SCENE.instantiate() as CharacterBody3D
	if player == null:
		push_error("Player scene root must inherit CharacterBody3D.")
		return
	add_child(player)
	player.global_transform = spawn_point.global_transform
