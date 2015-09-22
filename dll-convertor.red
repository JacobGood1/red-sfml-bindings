Red []

uppercase-char: charset "QWERTYUIOPASDFGHJKLZXCVBNM"
any-char: charset "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789!@#$%^&*(),.;'/` -_"
code: []

change: function [series val] [
	insert remove series val
]

parse-c++: [
	thru "inline " 
	copy return-value to #" " (append code return-value) 
	thru "__cdecl "
	copy fn-name to #"(" (append code fn-name)
	skip 1
	copy args to #")" 	(append code args)
]


uppercase-to-lower-with-dash: [
	(
		str: copy "-"
		change mark append str lowercase mark/1	
	)
]

format-code:  [
    end
    | mark: uppercase-char uppercase-to-lower-with-dash format-code 
    | copy stars some #"*" (remove/part mark length? stars) mark: back mark format-code
    | any-char format-code 
]

;string: "sfSprite**** sprite, float** x, float y, int**** mMomIs" 

;parse string format-code 



convert-args: function [arg] [
	new-arg: copy ""
	format-type: [
		(
			trim type
			type: switch/default type [
				"float"  ["[float32!]"]
				"double" ["[float!]"]
				"int"    ["[integer!]"]
			] [
				insert type "["
				append type "!]" 
				type
			]
			append new-arg type
			append new-arg " "
			if not mark [
				remove back back tail arg
			]
			append new-arg arg
		)
	]

	convert-args-rule: [
		copy type thru #" " copy arg thru ", " format-type
		| copy type thru #" " copy arg to end mark: format-type
	]

	parse arg [some convert-args-rule]

	new-arg
]




parse 
{
	extern "C" __declspec(dllexport) inline void __cdecl sf_sprite_set_position(sfSprite**** sprite, float** x, float y, int**** myMom)
{
	sfVector2f temp = { x,y };
	sfSprite_setPosition(sprite, temp);
}

extern "C" __declspec(dllexport) inline void __cdecl sf_sprite_destroy(sfSpriteFerGiva* sprite)
{
	sfSprite_destroy(sprite);
}

extern "C" __declspec(dllexport) inline void __cdecl sf_render_window_clear(sfRenderWindow* window)  //TODO add color parameter later on maybe
{
	sfRenderWindow_clear(window, sfBlack);
}
extern "C" __declspec(dllexport) inline void __cdecl sf_render_window_draw_sprite(sfRenderWindow* window, const sfSprite* sprite)
{
	sfRenderWindow_drawSprite(window, sprite, nullptr);
}
extern "C" __declspec(dllexport) inline void __cdecl sf_render_window_display(sfRenderWindow* window)
{
	sfRenderWindow_display(window);
}

} [some parse-c++]



;parse "sf-sprite* sprite, float x, float y" [to ] 

;; TODO fix this haneous garbage!

;hi: [1 2 3 1 2 3 1 2 3]
;
;
;
;while [not tail? code] [
;	parse code/3 format-code
;	parse code/3 rule-convert-args
;	code: skip code 3	
;	
;]








;probe head code
;print blk
;print code

;remove back tail worked
;print worked