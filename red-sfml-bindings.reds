Red/System []

#switch OS [ 
    Windows [
    	#define csfml "libs/csfml-wrapper.dll"
		#define calling cdecl
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


#define sf-render-window! int-ptr!
#define sf-clock! int-ptr!
#define sf-time!  int-ptr!
#define sf-event! int-ptr!
#define sf-enum! integer!

#enum sf-event-type! [
	sf-event-closed                 
    sf-event-resized                
    sf-event-lost-focus              
    sf-event-gained-focus            
    sf-event-text-entered            
    sf-event-key-pressed             
    sf-event-key-released            
    sf-event-mouse-wheel-moved        
    sf-event-mouse-wheel-scrolled    
    sf-event-mouse-button-pressed     
    sf-event-mouse-button-released   
    sf-event-mouse-moved             
    sf-event-mouse-entered           
    sf-event-mouse-left              
    sf-event-joystick-button-pressed  
    sf-event-joystick-button-released 
    sf-event-joystick-moved          
    sf-event-joystick-connected      
    sf-event-joystick-disconnected   
    sf-event-touch-began            
    sf-event-touch-moved             
    sf-event-touch-ended             
    sf-event-sensor-changed         

    sf-event-count                  
]

#import [
	csfml calling [
		sf-render-window-create: "sf_render_window_create" [
			width   [integer!]
			height  [integer!]
			title   [c-string!]
			return: [sf-render-window!]
		]
		sf-render-window-open?: "sf_render_window_is_open" [
			window  [sf-render-window!]
			return: [logic!]
		]
		sf-render-window-poll-event: "sf_render_window_poll_event" [
			window [sf-render-window!]
			event  [sf-event!]
			return: [logic!]
		]
		sf-render-window-set-title: "sf_render_window_set_title" [
			window [sf-render-window!]
			title  [c-string!]
		]
		sf-render-window-close: "sf_render_window_close" [
			window [sf-render-window!]
		]
		sf-render-window-destroy: "sf_render_window_destroy" [
			window [sf-render-window!]
		]
		sf-clock-create: "sf_clock_create" [
			return: [sf-clock!]
		]
		sf-clock-destroy: "sf_clock_destroy" [
			sf-clock [sf-clock!]
		]
		sf-clock-restart: "sf_clock_restart" [
			sf-clock [sf-clock!]
			return: [sf-time!]
		]
		sf-time-zero: "sf_time_zero" [
			return: [sf-time!]
		]
		sf-time-per-frame: "sf_time_per_frame" [
			return: [sf-time!]
		]
		sf-time-milliseconds: "sf_time_milliseconds" [
			sf-time [sf-time!]
			return: [integer!]
		]
		sf-time-subtract: "sf_time_subtract" [
			this    [sf-time!]
			other   [sf-time!]
			return: [sf-time!]
		]
		sf-time-add: "sf_time_add" [
			this    [sf-time!]
			other   [sf-time!]
            return: [sf-time!]
		]
		sf-time-greater-than: "sf_time_greater_than" [
			this    [sf-time!]
			other   [sf-time!]
			return: [logic!]
		]
    	sf-event-create: "sf_create_event" [
    		return: [sf-event!]
    	]
    	sf-event-get-type: "sf_event_get_type" [
    		event [sf-event!]
    		return: [sf-enum!]
    	]
	]
]



;; make sure sf-clock-create is inside a function accessed locally

;test area


window: sf-render-window-create 1000 500 "hi there"

event: declare sf-event!


time-since-last-update: sf-time-zero
time-per-frame: sf-time-per-frame




main: func [] [
	
	clock: sf-clock-create
	
	while [sf-render-window-open? window] [
		while [sf-render-window-poll-event window event] [
			if (sf-event-get-type event) = sf-event-closed [
				sf-render-window-close window
			]
			if (sf-event-get-type event) = sf-event-mouse-moved [
				print "hiya"
			]
			print "hi"
		]

	    sf-clock-restart clock
		print "hi"
		
		sf-time-greater-than time-since-last-update time-since-last-update
		time-since-last-update: sf-time-add time-since-last-update time-since-last-update
		while [sf-time-greater-than time-since-last-update time-per-frame] [
			sf-time-set-subtract time-since-last-update time-per-frame
			print "working"
		]

	]
]

main

sf-render-window-destroy window