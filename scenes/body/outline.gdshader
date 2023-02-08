shader_type spatial;

uniform bool show;
uniform vec4 color: source_color;

void fragment() {
	// Place fragment code here.
	
	ALBEDO = color.rgb;
	
	if (show) {
		
		ALPHA = color.a;
	} else {
		
		ALPHA = 0.0;
		
	};

}
