Red/System []

#switch OS [ 
    Windows [
    	#define calling cdecl
    	#define graphics "csfml-graphics-2.dll"
    ]
    Mac []
    Linux []
]

#define sf-render-window! byte-ptr!
#define sf-sprite!        byte-ptr! 
#define sf-clock!         byte-ptr!
#define sf-texture!       byte-ptr!

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

#import [
	graphics calling [
		sf-render-window-create: "sfRenderWindow_create" [
			mode     [sf-video-mode!]
			title    [c-string!]
			style    [integer!]
			settings [sf-context-settings!]
			return:  [sf-render-window!]
		]
		sf-render-window-open?: "sfRenderWindow_isOpen" [
			window 	[sf-render-window!]
			return: [logic!]
		]
	]
]

main: func [] [
	mode: declare sf-video-mode!
	mode/width: 1000
	mode/height: 1000
	mode/bits-per-pixel: 32
	
	window: sf-render-window-create mode "hi" 2 NULL 
	while [sf-render-window-open? window] [
		1
	]
]

main