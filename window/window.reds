Red/System []

#switch OS [ 
    Windows [
    	#define window-lib "libs/csfml-wrapper.dll"
        #define calling     cdecl
    ]
    Mac []
    Linux []
]

#include %../sfml-structs.reds

#import [
	window-lib calling [
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
		sf-render-window-draw-sprite: "sf_render_window_draw_sprite" [	
			window [sf-render-window!]
			sprite [sf-sprite!]
		]
		sf-render-window-clear: "sf_render_window_clear" [
			window [sf-render-window!]
		]
		sf-render-window-display: "sf_render_window_display" [
			window [sf-render-window!]
		]

	]
]