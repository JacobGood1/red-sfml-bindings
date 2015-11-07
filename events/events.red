Red []

#system [
	#include %events.reds
]

event: context [
	;args: [event* [integer!] return: [integer!]]  
	;event-gen: function [word [word!] return: [routine!]] [
	;	code: compose [
	;		either ([(get-type event*)]) = (word) [
	;			true
	;		] [
	;			false
	;		]
	;	]
	;	routine args code
	;]
	keys: #(
		a          0
		b          1
		c          2
		d          3
		e          4
		f          5
		g          6
		h          7
		i          8
		j          9
		k          10
		l          11
		m          12
		n          13
		o          14
		p          15
		q          16
		r          17
		s          18
		t          19
		u          20
		v          21
		w          22
		x          23
		y          24
		z          25
		num-0      26
		num-1      27
		num-2      28
		num-3      29
		num-4      30
		num-5      31
		num-6      32
		num-7      33
		num-8      34
		num-9      35
		escapepe   36
		l-control  37
		l-shift    38
		l-alt      39    
		l-system   40
		r-control  41
		r-shift    42
		r-alt      43
		r-system   44
		menu       45
		l-bracket  46
		r-bracket  47
		semi-colon 48
		comma      49
		period     50
		quote      51
		slash      52
		back-slash 53
		tilde      54
		equal      55
		dash       56
		space      57
		return     58
		back       59
		tab        60
		page-up    61
		page-down  62
		end        63
		home       64
		insert     65
		delete     66
		add        67
		subtract   68
		multiply   69
		divide     70
		left       71
		right      72
		up         73
		down       74
		num-pad-0  75
		num-pad-1  76
		num-pad-2  77
		num-pad-3  78
		num-pad-4  79
		num-pad-5  80
		num-pad-6  81
		num-pad-7  82
		num-pad-8  83
		num-pad-9  84
		f-1        85
		f-2        86
		f-3        87
		f-4        88
		f-5        89
		f-6        90
		f-7        91
		f-8        92
		f-9        93
		f-10       94
		f-11       95
		f-12       96
		f-13       97
		f-14       98
		f-15       99
		pause      100
		count      101
	)
	get-type: routine [event* [integer!] return: [integer!]] [
		sf-event-get-type as byte-ptr! event*
	]
	get-key-code: routine [event* [integer!] return: [integer!]] [
		sf-event-get-key-code as byte-ptr! event*
	]
	key-pressed?: routine [event* [integer!] return: [logic!]] [
		either (get-type event*) = sf-event-key-pressed [
			true
		] [
			false
		]
	]
	key-released?: routine [event* [integer!] return: [logic!]] [
		either (get-type event*) = sf-event-key-released [
			true
		] [
			false
		]
	]
	window-closed?: routine [event* [integer!] return: [logic!]] [
		either (get-type event*) = sf-event-closed [
			true
		] [
			false
		]
	]	
	;key-pressed?:   event-gen sf-event-key-pressed    ;TODO maybe these will work later, nice to check back 
	;key-released?:  event-gen 'sf-event-key-released
	;window-closed?: event-gen 'sf-event-closed	
]