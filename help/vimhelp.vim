	*Insert mode*

Ctrl-h -- backspace
Ctrl-w -- delete back one word
Ctrl-u -- delete back this line to the start
Ctrl-[ -- Escape
Ctrl-o -- Normal mode in Insert mode
Ctrl-r[number] -- Past the yanked text from buffer [number]
Ctrl-r= [math] -- Use Vim calculator and insert it to the text after <Enter>
Ctrl-v u#### -- insert special symbol by Unicode
Ctrl-k {char1}{char2} -- insert digraph or the symbol
					-- << -> «
					-- 12 -> ½ (1/2)
					:h digraph-table
Ctrl-x Ctrl-f -- autoinsert file names from current directory
Ctrl-x Ctrl-k -- word from dictionary
	


	*Normal Mode*

ga -- show the information about symbol
]s -- next spelling error
[s -- previous spelling error
zg -- add the word under cursor to the dictionary
zug -- undo zg command
z= -- print list of possible variants
zo -- open foldings
zc -- close foldings


	*Command Mode*

Ctrl-w -- delete one word back
Ctrl-u -- delete one line back
Ctrl-r[number] -- insert from register [number]
Ctrl-k -- insert special symbols
Ctrl-r Ctrl-w -- insert word under cursor
:[number]p -- print line [number]
			-- % -- all
			-- $ -- last line
			-- . -- current line
