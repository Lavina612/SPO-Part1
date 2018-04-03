( task1 : parity ) 
: parity 2 % not ;

( task2 : prime )
: prime dup 4 < 
	if 1 
	else 
		dup 2 / >r 2 >r 
		repeat 
			dup r@ % 
			if r> 1 + dup r@ <= 
				if >r 0
				else r> 2drop 1 1
				then
			else r> r> 2drop 0 1
			then
		until  
	then swap drop ;

( task3 : prime-allot )
: prime-allot prime 8 allot dup -rot c! ;

( task4 : concat)
: concat swap 2dup count swap count 1 + + heap-alloc >r r@ swap dup count >r string-copy r> r@ + swap string-copy r> ;

( task5 : radical, hash = 58640, %3 = 2 )
: radical 0 >r dup 1 + 2 for
	dup r@ % not
		if r@ prime 
			if r> r> r> 1 + rot dup >r -rot >r >r >r 
			then
		then
	endfor
	drop 1 r> 0 for
		r> r> r> -rot >r >r *
	endfor ;
	