Red []

#system [
	#include %window.reds
]

window: context [
	draw-sprite: routine [window [integer!] sprite-address [integer!]] [
		sf-render-window-draw-sprite as byte-ptr! window as byte-ptr! sprite-address
	]
	close: routine [window* [integer!]] [
		sf-render-window-close as byte-ptr! window*
	]
]