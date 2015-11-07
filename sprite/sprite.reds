Red/System []



#switch OS [ 
    Windows [
    	#define sprite-lib "libs/csfml-wrapper.dll"
        #define calling     cdecl
    ]
    Mac []
    Linux []
]

#include %../sfml-structs.reds


vector!: alias struct! [
    x  [float32!] 
    y  [float32!]
]

#import [
    sprite-lib calling [
        sf-sprite-create: "sf_sprite_create" [
            return: [integer!]
        ]
		sf-sprite-set-texture: "sf_sprite_set_texture" [
			sprite  [sf-sprite!]
			texture [sf-texture!]
		]
		sf-sprite-set-position: "sf_sprite_set_position" [
			sprite [sf-sprite!]
			x      [float32!]
			y      [float32!]
		] 
		sf-sprite-destroy: "sf_sprite_destroy" [
			sprite [sf-sprite!]
		]
		sf-vector-create: "sf_vector_create" [
			x [float32!]
			y [float32!]
			return: [vector!]
		]
		sf-sprite-set-origin-to-center: "sf_sprite_set_origin_to_center" [
			sprite [sf-sprite!]
		]
	]
]