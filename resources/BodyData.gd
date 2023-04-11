@tool
extends Resource

class_name BodyData

@export var noise: NoiseTexture2D:
	set(value):
		
		noise = value
		emit_changed()

@export var gradient: GradientTexture1D:
	set(value):
		
		gradient = value
		emit_changed()

@export_enum("ROCKY", "ATMOSPHERE", "OCEANIC", "GAS_GIANT") var biome: int:
	set(value):
		biome = value
		emit_changed()

@export_range(1.0, 10.0, 0.01) var scale: float = 1.0:
	set(value):
		scale = value
		emit_changed()

@export var ocean: Color:
	set(value):
		ocean = value
		emit_changed()

@export var ocean_fresnel: Color:
	set(value):
		ocean_fresnel = value
		emit_changed()

@export var atmosphere: Color:
	set(value):
		atmosphere = value
		emit_changed()

@export var atmosphere_fresnel: Color:
	set(value):
		atmosphere_fresnel = value
		emit_changed()
