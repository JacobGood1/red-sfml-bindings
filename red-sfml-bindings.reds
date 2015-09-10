Red/System []

#switch OS [ 
    Windows [
    	#define csfml "libs/sfml-wrapper.dll"
    	#define calling cdecl
    ]
    Mac []
    Linux []
]

#define sf-render-window! byte-ptr!

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


#enum sf-event-type! [
	sf-evt-closed                 
    sf-evt-resized                
    sf-evt-lost-focus              
    sf-evt-gained-focus            
    sf-evt-text-entered            
    sf-evt-key-pressed             
    sf-evt-key-released            
    sf-evt-mouse-wheel-moved        
    sf-evt-mouse-wheel-scrolled    
    sf-evt-mouse-button-pressed     
    sf-evt-mouse-button-released   
    sf-evt-mouse-moved             
    sf-evt-mouse-entered           
    sf-evt-mouse-left              
    sf-evt-joystick-button-pressed  
    sf-evt-joystick-button-released 
    sf-evt-joystick-moved          
    sf-evt-joystick-connected      
    sf-evt-joystick-disconnected   
    sf-evt-touch-began            
    sf-evt-touch-moved             
    sf-evt-touch-ended             
    sf-evt-sensor-changed         

    sf-evt-count                  
]
comment {
	prob dont need this crap
#enum window-style! [
	sf-none:          0 ; No border / title bar (this flag and all others are mutually exclusive)
    sf-title-bar:     1 ; Title bar + fixed border
    sf-resize:        2 ; Titlebar + resizable border + maximize button
    sf-close:         4 ; Titlebar + close button
    sf-full-screen:   8 ; Fullscreen mode (this flag and all others are mutually exclusive)
    sf-default-style: 7 ; Default window style
]
}

sf-event!: alias struct! [
    type [integer!]
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
	]
]


window: declare sf-render-window!

window: sf-render-window-create 1000 500 "hi there"
sf-render-window-create 1000 500 "hi there"

event: declare sf-event!


while [sf-render-window-open? window] [
	while [sf-render-window-poll-event window event] [
		if (event/type = sf-evt-closed) [
			sf-render-window-close window
		]
		if (event/type = sf-evt-mouse-moved) [
			print "hiya"
		]
	]
]
