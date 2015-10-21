Red/System []

#switch OS [ 
    Windows [
    	#define texture-lib "libs/csfml-wrapper.dll"
        #define calling     cdecl
    ]
    Mac []
    Linux []
]

#include %../sfml-structs.reds

#import [
	texture-lib calling [
		sf-texture-create: "sf_texture_create" [
			file-location [c-string!]
			return:       [sf-texture!]
		]
		sf-texture-destroy: "sf_texture_destroy" [
			file-location [sf-texture!]
		]
	]
]


