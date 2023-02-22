@tool
extends Resource

class_name BodyData

@export var noise: NoiseTexture2D

@export var gradient: GradientTexture1D

@export_enum("ROCKY", "ATMOSPHERE", "OCEANIC", "GAS_GIANT") var biome: int :
	set(value):
		
		biome = value
		emit_changed()

@export_range(1.0, 10.0, 0.01) var scale: float = 1.0

@export var ocean: Color

@export var ocean_fresnel: Color

@export var atmosphere: Color

@export var atmosphere_fresnel: Color
