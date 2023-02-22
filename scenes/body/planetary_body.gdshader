shader_type spatial;

uniform sampler2D height_map;
uniform sampler2D surface_gradient;
uniform sampler2D normal_map;
uniform float sample_scale;
uniform bool emmit;

varying vec4 height_sample;


void vertex() {
	
	height_sample = texture(height_map, UV);
	
	VERTEX += NORMAL * height_sample.x * sample_scale;
	
}


void fragment() {
	
	vec4 color_sample = texture(surface_gradient, vec2(height_sample.x , 0.0));
	
	ALBEDO = color_sample.rgb;
	
	if (emmit) {
		
	EMISSION = color_sample.rgb;
	
	};
	
	NORMAL_MAP = texture(normal_map, UV).rgb;
}

