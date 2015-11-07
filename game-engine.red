Red []

#system [
	#include %red-sfml-bindings.reds
]

#include %events/events.red
#include %texture/texture.red
#include %sprite/sprite.red



game: object [
	handle-init-screen: func [] []
	handle-events: 		func [window* [integer!] event* [integer!]] []
	handle-update: 		func [time [integer!]] []
	handle-render: 		func [window* [integer!]] []
	handle-shut-down: 	func [] []
]

;TODO when red is capable make it to where one can overwrite the functions in this
;current game so that the updated ones will get called in reds 


; the following code is extraneous code that the game engine does not need... for testing the binding only

;; TEST BEGIN!
texture/make eagle
texture/make desert

; the following code is extraneous code that the game engine does not need... for testing the binding only
; this code does not use features that red WILL have, meaning it needs to be discarded

;; TEST BEGIN!

entity: object [
	velocity: make vector! [0 0]
	set-velocity: func [v [vector!]] [
		velocity: v 
		self
	]
]

aircraft: sprite/make texture/textures/eagle 
aircraft: make aircraft entity


;; TEST END!!!

current-game: make game [
	handle-update: func [time [integer!]] [

	]
	handle-events: func [window* [integer!] event* [integer!]] [
		if event/window-closed? event* [
			window/close window*
		]
		if event/key-pressed? event* [
		]
	]
	handle-render: func [window* [integer!]] [
		aircraft/draw window*
	]
	handle-shut-down: func [] [
		texture/destroy eagle
		texture/destroy dessert
		aircraft/destroy ;maybe unecessary
	]
]
;; TEST END!!!


#system [
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
		set-callbacks :init-screen-callback
					  :process-events-callback
					  :update-callback 
					  :render-callback 
					  :shut-down-callback
		start-screen width
					 height
					 as c-string! string/rs-head title
	]
]




current-game/start "hello" 640 480



