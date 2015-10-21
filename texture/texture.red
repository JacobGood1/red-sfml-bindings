Red []

#system [
	#include %texture.reds
]

texture: context [
	textures: #()
	create-address: routine [location [string!] return: [integer!]] [
		as integer! sf-texture-create as c-string! string/rs-head location
	]
	make-texture: function [name [word!]] [
		temp: form name
		append temp ".png"
		insert temp "images/"
		put textures name create-address temp
	]
]

