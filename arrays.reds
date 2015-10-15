Red/System []

integer-array!: alias struct! [
	size [integer!]
	arr  [int-ptr!]
]
sprite-array!: alias struct! [
	size [integer!]
	arr  [byte-ptr!]
] 

;array: context [
;	make-int: func [amount [integer!] return: [integer-array!] /local arr] [
;		arr: declare integer-array!
;		arr/size: amount
;		arr/arr: as int-ptr! allocate (size? integer!) * amount
;		arr 
;	]
;	free-int: func [arr [integer-array!]] [
;		free as byte-ptr! arr/arr
;	]
;	set-int: func [arr [integer-array!] pos [integer!] value [integer!] /local counter][
;		if any [pos > arr/size pos < 1] [
;			print "ARRAY OUT OF BOUNDS!"
;			throw 1 
;		]
;		arr/arr/pos: value
;		
;	]
;	get-int: func [arr [integer-array!] pos [integer!] return: [integer!]] [
;		if any [pos > arr/size pos < 1] [
;			print "ARRAY OUT OF BOUNDS!"
;			throw 1 
;		]
;		arr/arr/pos
;	]
;	make-sprite: func [amount [integer!] return: [sprite-array!] /local arr s] [
;		arr: declare sprite-array!
;		arr/size: amount
;		s: size? byte-ptr!
;		arr/arr: allocate s * amount
;		arr 
;	]
;	free-sprite: func [arr [sprite-array!]] [
;		free arr/arr
;	]
;	set-sprite: func [arr [sprite-array!] pos [integer!] val [byte-ptr!] /local counter][
;		if any [pos > arr/size pos < 1] [
;			print "ARRAY OUT OF BOUNDS!"
;			throw 1 
;		]
;		arr/arr/pos: val
;		
;	]
;	get-sprite: func [arr [sprite-array!] pos [integer!] return: [byte-ptr!]] [
;		if any [pos > arr/size pos < 1] [
;			print "ARRAY OUT OF BOUNDS!"
;			throw 1 
;		]
;		arr/arr/pos
;	]
;]