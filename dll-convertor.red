Red []


camel-case->red-case: function [word [string!]] [
	new-word: copy "" 
	foreach letter word [
		either find uppercase-char letter [ 
			append new-word "-" append 
			new-word lowercase letter 
		] [
			append new-word letter
		]
	]
	new-word
]



uppercase-char: charset "QWERTYUIOPASDFGHJKLZXCVBNM"
alpha-char: charset "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
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

types: [
	"float"  ["[float32!]"]
	"double" ["[float!]"]
	"int"    ["[integer!]"]
	"char"   ["[c-string!]"]
	"bool"   ["[logic!]"]
]

format-type: [
	(
		remove/part mark (length? type)
		remove/part mark (length? arg)
		trim type
		type: switch/default type types [
			insert type "["
			append type "!]" 
			type
		]

		either tail? mark [ 
			insert mark type
			insert mark " "
			insert mark arg
			insert mark " "
			remove back mark
		] [
			insert mark " "
			insert mark type
			remove back back tail arg
			insert mark arg
		]

		mark: skip mark (length? type) + (length? arg) + 1
	)
]

cancel-args: [
	  "const "
	| "void"
]

cancel-arg-rule: [
	mark: copy arg cancel-args (remove/part mark length? arg) :mark
]


convert-args-rule: [
	cancel-arg-rule 
	| mark: copy type thru #" " copy arg thru ", " format-type :mark
	| copy type thru #" " copy arg to end format-type
]

;kek: "sf-sprite sprite, float x, float y, int my-mom"
;
;parse kek [some convert-args-rule]
;
;
;probe kek
parse trim
{
	extern "C" __declspec(dllexport) inline void __cdecl sf_render_window_close(sfRenderWindow* window)
{
	sfRenderWindow_close(window);
}

} [some parse-c++]


str-format-for-final: ""
final-code: []
fn-name-rule: [
	copy c to #"_" 
	mark:
	(remove mark head insert mark "-") 
	skip
	fn-name-rule
]



foreach [ret name args] code [
	parse ret format-code
	if (first ret) = #"-" [remove head ret]
	parse args format-code	
	parse args [some convert-args-rule]
	if ret <> "void" [
		ret: switch/default ret types [insert ret "[" append ret "!]"]
		insert ret "return: "
		append args ret
	]
	insert args "["
 
	insert name {"}
	append name {" }
	insert args name
	parse name fn-name-rule
	remove head name
	remove back back tail name
	insert back tail name ":"
	insert args name

	append str-format-for-final args

	append str-format-for-final "] "
	append final-code str-format-for-final
	str-format-for-final: copy ""
]





foreach var final-code [
	parse var [some [copy name thru ":" thru {"} copy link-name thru {"} thru "[" (insert link-name {"} print [name link-name "["]) | copy args thru "]" (print args)]]
]





;probe head code
;print blk
;print code

;remove back tail worked
;print worked