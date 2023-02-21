@tool
extends Resource

class_name BodyData

@export var noise: NoiseTexture2D

@export var surface_graident: GradientTexture1D

@export_enum("ROCKY", "ATMOSPHERE", "OCEANIC", "GAS_GIANT") var biome: int

@export_range(0.01, 1.0) var radius_ratio: float = 1.0
