Red []

#system [
	#include %texture.reds
]

texture: context [
	textures: #()
	create-address: routine [location [string!] return: [integer!]] [
		as integer! sf-texture-create as c-string! string/rs-head location
	]
	make: function ['name [word!]] [
		temp: form name
		append temp ".png"
		insert temp "images/"
		put textures name create-address temp
	]
	destroy-internal: routine [texture* [integer!]] [
		sf-texture-destroy as byte-ptr! texture*
	]
	destroy: function ['name [word!]] [
		destroy-internal textures/name
		put textures name none
	]
]

