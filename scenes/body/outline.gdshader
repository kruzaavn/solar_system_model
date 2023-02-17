shader_type spatial;

uniform bool show;
uniform vec4 color: source_color;
uniform sampler2D alpha;

float get_alpha(vec3 normal, vec3 view) {
	
	float shade =  dot(normalize(normal), normalize(view));
	
	return texture(alpha, vec2(shade, 0.0)).r;
}


void fragment() {
	// Place fragment code here.
	
	ALBEDO = color.rgb;
	
	if (show) {
		
		ALPHA = get_alpha(NORMAL, VIEW);
		
	} else {
		
		ALPHA = 0.0;
		
	};

}
