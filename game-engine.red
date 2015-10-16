Red []

#system [
	#include %red-sfml-bindings.reds
]

update: function [time [integer!]] [
	
]

	
sprite: object [
	create: routine [name [string!] return: [integer!]] [
		texture:              sf-texture-create as c-string! string/rs-head name
		sprite:               sf-sprite-create
		sf-sprite-set-texture sprite texture
		as integer! sprite
	]
	draw: routine [window [integer!] sprite [integer!]] [
		sf-render-window-draw-sprite as byte-ptr! window as byte-ptr! sprite
	] 
]



init-screen: func [] [
	print "=== Init-screen ==="
	spr-mario: sprite/create "images/Telo.png"	
]



render: func [*window [integer!]] [
	sprite/draw *window spr-mario
]


#system [
    ;mario:   sf-sprite-create 
    ;texture: sf-texture-create "images/Telo.png"
    ;sf-sprite-set-texture  mario texture
   	;sf-sprite-set-position mario as float32! 100.0 as float32! 100.0

	update-callback: func [[cdecl] time [integer!]] [
		#call [update time]
	]
	init-screen-callback: func [[cdecl]] [
		#call [init-screen]
		;vec: sf-vector-create as float32! 100.0 as float32! 100.0
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
		;sf-render-window-draw-sprite window mario
		sf-render-window-display window 
	]

	shut-down-callback: func [[cdecl]] [
		print "Closing..."
	]
]




start-from-red: routine [] [
	start 400 800 "title" :init-screen-callback :process-events-callback :update-callback :render-callback :shut-down-callback
]

start-from-red