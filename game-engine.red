Red []

#system [
	#include %red-sfml-bindings.reds
]

routines: context [
	create-texture-address: routine [location [string!] return: [integer!]] [
		as integer! sf-texture-create as c-string! string/rs-head location
	]
	create-sprite-address: routine [return: [integer!]] [
		as integer! sf-sprite-create
	]
	set-texture: routine [sprite [integer!] texture [integer!]] [
		sf-sprite-set-texture as byte-ptr! sprite as byte-ptr! texture
	]
	draw: routine [window [integer!] sprite-address [integer!]] [
		sf-render-window-draw-sprite as byte-ptr! window as byte-ptr! sprite-address
	]
	destroy: routine [sprite-address [integer!] texture-address [integer!]] [
		sf-sprite-destroy  as byte-ptr! sprite-address
		sf-texture-destroy as byte-ptr! texture-address
	]
]

make-sprite: function [location [string!]] [
	temp: object [
		texture-address: none
		sprite-address:  none
		draw: func [window [integer!]] [
			routines/draw window sprite-address
		]
		destroy: func [] [
			routines/destroy sprite-address texture-address
		]
	]
	temp/texture-address: routines/create-texture-address location
	temp/sprite-address: routines/create-sprite-address
	routines/set-texture temp/sprite-address temp/texture-address
	temp
]

init-screen: func [] [
	print "=== Init-screen ==="
	spr-mario: make-sprite "test/mario.png"	
]

update: function [time [integer!]] [
	
]


render: func [*window [integer!]] [
	spr-mario/draw *window
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
	process-events-callback: func [[cdecl] window [sf-render-window!] event* [sf-event!]] [
		switch event/type event* [
			sf-event-closed [
				sf-render-window-close window
			]
			sf-event-key-pressed [
				probe (event/key-pressed event*) = key-b
				0
			]
			default [
				;print as byte! event/code event*
				0
			]
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