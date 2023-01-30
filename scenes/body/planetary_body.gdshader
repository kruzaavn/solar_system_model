shader_type spatial;

uniform sampler2D height_map;
uniform sampler2D mesh_texture;
uniform float sample_scale;

void fragment() {
	
	vec4 color_sample = texture(mesh_texture, UV);
	
	ALBEDO = color_sample.rgb;
	
	// Place fragment code here.
}

void vertex() {
	
	vec4 height_sample = texture(height_map, UV);
	
	VERTEX += NORMAL * height_sample.x * sample_scale;
	
}