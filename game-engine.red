Red []

#system [
	#include %red-sfml-bindings.reds
]

#include %events/events.red
#include %texture/texture.red
#include %sprite/sprite.red

init-screen: func [] [
	print "=== Init-screen ==="
	texture/make-texture 'mario
	spr-mario: sprite/make-sprite texture/textures/mario
]


handle-events: function [window* [integer!] event* [integer!]] [
	key-code: event/get-key-code event*
	if event/key-pressed? event* [
		case [ ;TODO change to switch if possible
			key-code = event/keys/a [
				print "here!"
			]
			key-code = event/keys/p [
				window/close window*
			]
		]
	]
]

update: function [time [integer!]] [
	
]


render: func [window* [integer!]] [
	spr-mario/draw window*
]

shut-down: func [] [
	spr-mario/destroy
]
;
;;TODO enums in red? use a map for key-cods?  anyway get key codes working some how!
;
#system [
;    ;mario:   sf-sprite-create 
;    ;texture: sf-texture-create "images/Telo.png"
;    ;sf-sprite-set-texture  mario texture
;   	;sf-sprite-set-position mario as float32! 100.0 as float32! 100.0
;
	update-callback: func [[cdecl] time [integer!]] [
		#call [update time]
	]
	init-screen-callback: func [[cdecl]] [
		#call [init-screen]
		;vec: sf-vector-create as float32! 100.0 as float32! 100.0
	]
	process-events-callback: func [[cdecl] window* [sf-render-window!] event* [sf-event!]] [
		#call [handle-events as integer! window* as integer! event*]		
	]
	render-callback: func [[cdecl] window [sf-render-window!]] [
		sf-render-window-clear window
		#call [render as integer! window]
		sf-render-window-display window 
	]
	shut-down-callback: func [[cdecl]] [
		print "Closing..."
		#call [shut-down]
	]
]

start-from-red: routine [] [
	start 400 800 "title" :init-screen-callback :process-events-callback :update-callback :render-callback :shut-down-callback
]

start-from-red