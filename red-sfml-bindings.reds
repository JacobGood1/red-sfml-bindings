Red/System []

#switch OS [ 
    Windows [
    	#define csfml-audio    "libs/csfml-audio-2.dll"
    	#define csfml-graphics "libs/csfml-graphics-2.dll"
    	#define csfml-network  "libs/csfml-network-2.dll"
    	#define csfml-system   "libs/csfml-system-2.dll"
    	#define csfml-window   "libs/csfml-window-2.dll"
    	#define calling cdecl
    ]
    Mac []
    Linux []
]

comment {
	typedef struct
	{
	    unsigned int width;        ///< Video mode width, in pixels
	    unsigned int height;       ///< Video mode height, in pixels
	    unsigned int bitsPerPixel; ///< Video mode pixel depth, in bits per pixels
	} sfVideoMode;
}

sf-video-mode!: alias struct! [
	width          [integer!]
	height         [integer!]
	bits-per-pixel [integer!]
]

comment {
	typedef struct
	{
	    unsigned int depthBits;         ///< Bits of the depth buffer
	    unsigned int stencilBits;       ///< Bits of the stencil buffer
	    unsigned int antialiasingLevel; ///< Level of antialiasing
	    unsigned int majorVersion;      ///< Major number of the context version to create
	    unsigned int minorVersion;      ///< Minor number of the context version to create
	    sfUint32     attributeFlags;    ///< The attribute flags to create the context with
	} sfContextSettings;
}

sf-context-settings!: alias struct! [
    depth-bits          [integer!]  ; Bits of the depth buffer
    stencil-bits        [integer!]  ; Bits of the stencil buffer
    anti-aliasing-level [integer!]  ; Level of antialiasing
    major-version       [integer!]  ; Major number of the context version to create
    minor-version       [integer!]  ; Minor number of the context version to create
    attribute-flags     [integer!]  ; The attribute flags to create the context with
]

comment {
	typedef enum
	{
	    sfNone         = 0,      ///< No border / title bar (this flag and all others are mutually exclusive)
	    sfTitlebar     = 1 << 0, ///< Title bar + fixed border
	    sfResize       = 1 << 1, ///< Titlebar + resizable border + maximize button
	    sfClose        = 1 << 2, ///< Titlebar + close button
	    sfFullscreen   = 1 << 3, ///< Fullscreen mode (this flag and all others are mutually exclusive)
	    sfDefaultStyle = sfTitlebar | sfResize | sfClose ///< Default window style
	} sfWindowStyle;
}

#enum window-style! [
	sf-none:          0 ; No border / title bar (this flag and all others are mutually exclusive)
    sf-title-bar:     1 ; Title bar + fixed border
    sf-resize:        2 ; Titlebar + resizable border + maximize button
    sf-close:         4 ; Titlebar + close button
    sf-full-screen:   8 ; Fullscreen mode (this flag and all others are mutually exclusive)
    sf-default-style: 7 ; Default window style
]

#import [
	; sfRenderWindow* sfRenderWindow_create(sfVideoMode mode, const char* title, sfUint32 style, const sfContextSettings* settings)
	csfml-graphics calling [
		sf-render-window-create: "sfRenderWindow_create" [
			mode     [sf-video-mode!]
			title    [c-string!]
			style    [integer!]
			settings [sf-context-settings!]
		]
	]
]




; sfVideoMode mode = {800, 600, 32};
mode: declare sf-video-mode!
mode/width: 640
mode/height: 680
mode/bits-per-pixel: 32


; window = sfRenderWindow_create(mode, "SFML window", sfResize | sfClose, NULL);

sf-render-window-create mode "title" sf-resize or sf-close null 