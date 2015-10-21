Red/System []

;#switch OS [ 
;    Windows [
;    	#define event-lib   "../libs/csfml-wrapper.dll"
;    	#define calling     cdecl
;    ]
;    Mac []
;    Linux []
;]
;
;#include %../sfml-structs.reds

;#enum sf-event-key-code! [
	key-a
	key-b
	key-c
	key-d
	key-e
	key-f
	key-g
	key-h
	key-i
	key-j
	key-k
	key-l
	key-m
	key-n
	key-o
	key-p
	key-q
	key-r
	key-s
	key-t
	key-u
	key-v
	key-w
	key-x
	key-y
	key-z
	key-num-0
	key-num-1
	key-num-2
	key-num-3
	key-num-4
	key-num-5
	key-num-6
	key-num-7
	key-num-8
	key-num-9
	key-escape
	key-l-control
	key-l-shift
	key-l-alt
	key-l-system
	key-r-control
	key-r-shift
	key-r-alt
	key-r-system
	key-menu
	key-l-bracket
	key-r-bracket
	key-semi-colon
	key-comma
	key-period
	key-quote
	key-slash
	key-back-slash
	key-tilde
	key-equal
	key-dash
	key-space
	key-return
	key-back
	key-tab
	key-page-up
	key-page-down
	key-end
	key-home
	key-insert
	key-delete
	key-add
	key-subtract
	key-multiply
	key-divide
	key-left
	key-right
	key-up
	key-down
	key-numpad-0
	key-numpad-1
	key-numpad-2
	key-numpad-3
	key-numpad-4
	key-numpad-5
	key-numpad-6
	key-numpad-7
	key-numpad-8
	key-numpad-9
	key-f-1
	key-f-2
	key-f-3
	key-f-4
	key-f-5
	key-f-6
	key-f-7
	key-f-8
	key-f-9
	key-f-10
	key-f-11
	key-f-12
	key-f-13
	key-f-14
	key-f-15
	key-pause
	key-count
;]
;
;#enum sf-event-type! [
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
;]
;
;
;#import [
;	event-lib calling [
;		sf-event-get-key-code: "sf_event_get_key_code" [
;			event   [sf-event!]
;			return: [integer!]
;		]
;		sf-event-get-type: "sf_event_get_type" [
;			event   [sf-event!]
;			return: [integer!]
;		]
;	]
;]

