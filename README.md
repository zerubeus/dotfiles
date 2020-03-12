```
##############################################################################
# MY VIM KEYS
##############################################################################

NETRW + vim-vinegar

-                  hop up to the directory listing and seek to the
                   file you just came from
i                  change how you disiplay the files tree
:Explore           opens netrw in the current window
:Sexplore          opens netrw in a horizontal split
:Vexplore          opens netrw in a vertical split

.                  pre-populate it at the end of a : command line.
                   This is great, for example, to quickly initiate
                   a :grep of the file or directory under the cursor.
                   There's also !, which starts the line off with a bang.
                   Type !chmod +x and get :!chmod +x path/to/file

You can also snigger by typing :Sex to invoke a horizontal split.

y.                 yank an absolute path for the file under the cursor.

~                  to go home

CTRL-^ (CTRL-6)    switching back to the previous buffer from the netrw buffer.

GENERAL

F2                 save file
CRL+P              search for file in current project dir
:source %          source the vimrc after modification
:PlugInstall       instal new plugins
:PlugClean         removing plugins files after deleting it from vimrc

CTRL+d             maps to shift+tab (shift back words)
CTRL+j             move line down
CTRL+k             move line up

\                 the leader key maps to ,
,ev               open vimrc in new tab
,s                save state of open windows and buffers
,q                delete buffer completely without messing up window layout
,space            turn off search highlights
,r                reload vim config
,gf               create file under cursor

,1                switch tab maps to 1gt
,2                switch tab maps to 2gt
,3                switch tab maps to 3gt
,4                switch tab maps to 4gt
,5                switch tab maps to 5gt
,6                switch tab maps to 6gt
,7                switch tab maps to 7gt
,8                switch tab maps to 8gt
,9                switch tab maps to 9gt
,0                lat tab maps to :tablast

CTRL+left         maps to :tabprevious
CTRL-right        maps to :tabnext
CTRL+t            maps to :tabnew
,w                maps to :tabclose

n                 remaping n to n + zz (use help i you forget what n is)
N                 remaping N to Nzz

gd                coc go to definition
gy                coc type definition
gi                coc implementation
gr                coc references
]c                coc diagnostic next
[c                coc diagnostic prev]

,b                fzf buffers
,h                fzf history
,t                fzf Btags
,T                fzf tags
,p                fzf list tracked files untracked files minus your ignored
files
,gt               fzfRg

F5                you can use it to go to definition
```
