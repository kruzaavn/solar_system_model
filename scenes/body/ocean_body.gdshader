shader_type spatial;

uniform sampler2D depth_texture : hint_depth_texture;
uniform sampler2D normal;
uniform vec4 color: source_color;
uniform float metallic : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float roughness : hint_range(0.0, 1.0, 0.01) = 0.0;
uniform float wave: hint_range(1.0, 1000.0, 1.0) = 1.0;

uniform vec4 edge_color: source_color = vec4(1.0, 1.0, 1.0, 1.0);

varying vec3 world;


void vertex() {
	
	world = (MODEL_MATRIX * vec4(VERTEX, 1)).xyz;
	
}



void fragment() {
	
	float d = texture(depth_texture, UV).x;
	
	
	ALBEDO = color.rgb;
	ALPHA = color.a;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	RIM=0.2;
	NORMAL_MAP = texture(normal, vec2(UV.x + TIME / wave, UV.y )).rgb;
	NORMAL_MAP_DEPTH = 1.0;
}
