Red []

#system [
	#include %sprite.reds
]

#include %../texture/texture.red
#include %../window/window.red

sprite: context [
	create-address: routine [return: [integer!]] [ ;TODO might need to make sure as integer is called on sprite/create
		sf-sprite-create
	]
	set-texture: routine [sprite [integer!] texture [integer!]] [
		sf-sprite-set-texture as byte-ptr! 
		                         sprite 
		                      as byte-ptr! 
		                         texture
	]
	destroy-internal: routine [sprite-address [integer!]] [
		sf-sprite-destroy as byte-ptr! sprite-address
	]
	set-origin-to-center: routine [sprite-address [integer!]] [
		sf-sprite-set-origin-to-center as byte-ptr! sprite-address
	]
	
	make: function [texture* [integer!] return: [object!]] [
		temp: object [
			sprite-address: create-address
			draw: func [window* [integer!]] [
				window/draw-sprite window* sprite-address
			]
			destroy: func [] [
				destroy-internal sprite-address
			]
		]
		set-texture temp/sprite-address texture*
		set-origin-to-center temp/sprite-address
		temp
	]
]

