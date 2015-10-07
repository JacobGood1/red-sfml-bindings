Red []

#system [
	#include %red-sfml-bindings.reds
]

update: function [time [integer!]] [
	
]

	
sprite: object [
	create: routine [name [string!]] [
		texture:              sf-texture-create as c-string! string/rs-head name
		sprite:               sf-sprite-create
		sf-sprite-set-texture sprite texture
		sprite
	]
	draw: routine [window [integer!] sprite [integer!]] [
		sf-render-window-draw-sprite as byte-ptr! window as byte-ptr! sprite
	] 
]



init-screen: func [] [
	mario: sprite/create "test/mario.png"	
]



render: func [window [integer!]] [
	sprite/draw window mario	
]


#system [
	update-callback: func [[cdecl] time [integer!]] [
		#call [update time]
	]
	init-screen-callback: func [[cdecl]] [
		#call [init-screen]
		;vec: sf-vector-create as float32! 100.0 as float32! 100.0
		
		;sf-sprite-set-position mario-sprite as float32! 100.0 as float32! 100.0
		
	]
	process-events-callback: func [[cdecl] window [sf-render-window!] event [sf-event!]] [
		if event/type = sf-event-closed [
			sf-render-window-close window
		]
		if event/type = sf-event-key-pressed [
			print "hello"
		]
	
	]



	render-callback: func [[cdecl] window [sf-render-window!]] [
		sf-render-window-clear window
		#call [render as integer! window]
		sf-render-window-display window
	]

	shut-down-callback: func [[cdecl]] [
	]
]




start-from-red: routine [] [
	start 400 800 "title" :init-screen-callback :process-events-callback :update-callback :render-callback :shut-down-callback
]

start-from-red