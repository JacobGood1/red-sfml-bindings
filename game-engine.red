Red []

#system [
	#include %red-sfml-bindings.reds
]

#include %events/events.red
#include %texture/texture.red
#include %sprite/sprite.red

; PROBLEM red does not support this type of coding at this time, will have to add this feature 
; at a later date
; each game produce a new game object where functions can be overridden to spec of whoever desires! 
; TODO implement ^ right now game engine should be broken!



game: object [
	handle-init-screen: func [] []
	handle-events: func [window* [integer!] event* [integer!]] []
	handle-update: func [time [integer!]] []
	handle-render: func [window* [integer!]] []
	handle-shut-down: func [] []
]

current-game: make game []

;handle-init-screen: func [] [
;		print "=== Init-screen ==="
;		texture/make-texture 'mario
;		spr-mario: sprite/make-sprite texture/textures/mario
;	]
;	handle-update: function [time [integer!]] []
;	handle-events: func [window* [integer!] event* [integer!]] []


#system [
	;mario:   sf-sprite-create 
	;texture: sf-texture-create "images/Telo.png"
	;sf-sprite-set-texture  mario texture
	;sf-sprite-set-position mario as float32! 100.0 as float32! 100.0

	init-screen-callback: func [[cdecl]] [
		#call [current-game/handle-init-screen]
	]
	update-callback: func [[cdecl] time [integer!]] [
		#call [current-game/handle-update time]
	]
	process-events-callback: func [[cdecl] window* [sf-render-window!] event* [sf-event!]] [
		#call [current-game/handle-events as integer! window* as integer! event*]		
	]
	render-callback: func [[cdecl] window [sf-render-window!]] [
		sf-render-window-clear window
		#call [current-game/handle-render as integer! window]
		sf-render-window-display window 
	]
	shut-down-callback: func [[cdecl]] [
		print "Closing..."
		#call [current-game/handle-shut-down]
	]
]



current-game: make game [
	start: routine [title [string!] width [integer!] height [integer!]] [
		start-screen width
					 height
					 as c-string! string/rs-head title 
					 :init-screen-callback 
					 :process-events-callback 
					 :update-callback 
					 :render-callback 
					 :shut-down-callback
	]
]



current-game/start "hello" 400 400

