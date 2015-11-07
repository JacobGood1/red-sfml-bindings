Red/System []

#include %sfml-structs.reds

#switch OS [ 
    Windows [
    	#define csfml       "libs/csfml-wrapper.dll"
    	#define calling     cdecl
    ]
    Mac []
    Linux []
]


sf-video-mode!: alias struct! [
	width          [integer!]
	height         [integer!]
	bits-per-pixel [integer!]
]

sf-context-settings!: alias struct! [
    depth-bits          [integer!]  ; Bits of the depth buffer
    stencil-bits        [integer!]  ; Bits of the stencil buffer
    anti-aliasing-level [integer!]  ; Level of antialiasing
    major-version       [integer!]  ; Major number of the context version to create
    minor-version       [integer!]  ; Minor number of the context version to create
    attribute-flags     [integer!]  ; The attribute flags to create the context with
]



;sf-key-event!: alias struct! [ ;8
;	code    [integer!]
;	alt     [logic!] 
;	control [logic!] 
;	shift   [logic!] 
;	system  [logic!]
;]
;sf-size-event!: alias struct! [ ;8
;	width  [integer!]
;	height [integer!]
;]
;
;sf-event!: alias struct! [
;    type [integer!]
;    key  [sf-key-event!]
;    pad1  [float!]
;    pad2 [integer!]
;]
;
sf-time!: alias struct! [
	pad1 [integer!]
	pad2 [integer!]
]


#import [
	csfml calling [
		;reference for future stuff may erase later
		;start-screen: "start" [
		;	width          [integer!]
		;	height         [integer!]
		;	title          [c-string!]
		;	init-screen    [function! []]
		;	process-events [function! [
		;				   		window [sf-render-window!] 
		;				   		event  [sf-event!]
		;				   ]]
		;	update         [function! [time [integer!]]]
		;	render         [function! [window [sf-render-window!]]]
		;	shut-down      [function! []]
		;]
		start-screen: "start" [
			width          [integer!]
			height         [integer!]
			title          [c-string!]
		]

		set-callbacks: "set_callbacks" [
			init-screen    [function! []]
			process-events [function! [
			   			   		window [sf-render-window!] 
			   			   		event  [sf-event!]
						   ]]
			update         [function! [time [integer!]]]
			render         [function! [window [sf-render-window!]]]
			shut-down      [function! []]
		]
		sf-clock-create: "sf_clock_create" [
			return: [sf-clock!]
		]
		sf-clock-destroy: "sf_clock_destroy" [
			sf-clock [sf-clock!]
		]
		sf-clock-restart: "sf_clock_restart" [
			sf-clock [sf-clock!]
			return:  [sf-time!]
		]
		sf-time-zero: "sf_time_zero" [
			return: [sf-time!]
		]
		sf-time-per-frame: "sf_time_per_frame" [
			return: [sf-time!]
		]
		sf-time-get-milliseconds: "sf_time_get_milliseconds" [
			return: [integer!]
		]
		sf-time-set-subtract: "sf_time_subtract" [
			this    [sf-time!]
			other   [sf-time!]		]
		sf-time-set-add: "sf_time_set_add" [
			this    [sf-time!]
			other   [sf-clock!]
			return: [sf-time!]
		]
		sf-time-print: "sf_time_print" [
			this [sf-time!]
		]
		print-integer: "print_integer" [
			in [integer!]
		]
		
		sf-time-get-time: "sf_time_get_time" [
			time    [sf-time!]
			return: [float!]
		]
	]
]








;event: context [
;	type: func [event* [sf-event!] return: [integer!]] [
;		sf-event-get-type event*
;	]
;	key-pressed: func [event* [sf-event!] return: [integer!]] [
;		sf-event-get-key-code event* 
;	]
;]
;test-lib 
