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
		sf-sprite-set-texture as byte-ptr! sprite as byte-ptr! texture
	]
	destroy-internal: routine [sprite-address [integer!]] [
		sf-sprite-destroy as byte-ptr! sprite-address
	]
	make-sprite: function [texture* [integer!]] [
		temp: object [
			sprite-address:  none
			draw: func [window* [integer!]] [
				window/draw-sprite window* sprite-address
			]
			destroy: func [] [
				destroy-internal sprite-address
			]
		]
		temp/sprite-address: create-address
		set-texture temp/sprite-address texture*
		temp
	]
]

