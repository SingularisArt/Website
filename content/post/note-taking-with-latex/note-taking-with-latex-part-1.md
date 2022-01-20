---
title:        	"Note Taking with LaTeX: Part I (NeoVim)"
author:       	"Hashem A. Damrah"
introduction: 	"This post talks about how I take notes with LaTeX: Part I"
date:         	2022-01-08
description:    "I go over using NeoVim and LaTeX to take notes with, but I specifically talk about talking notes with Mathematics."
draft: 		 	    false
comments:		    true
cover:			    "/posts/images/note-taking-with-latex-part-1.png"
toc:			      true
tags:         	["latex", "tutorial", "school", "notes"]
---

For a **very long time**, I have been trying to create the perfect setup for
note taking in general (but more specifically, for **math**). Before, I used to
use <a class="center after" href="https://www.notion.com">notion</a> to take my
notes, which was okay, but I wanted something much more productive. And thus,
my system was **BORN**!

Here are how some of my notes look like:

![notes-image-1](/posts/images/note-1.png)
![notes-image-2](/posts/images/note-2.png)
![notes-image-3](/posts/images/note-3.png)

If you want to see how my completed notes look like, visit
<a class="center after" href="https://www.damrah.netlify.app/notes">here</a>.
I also store all of my notes
<a class="center after" href="https://www.github.com/SingularisArt/notes">here</a>.

I created this method during the summer of my **10th year** in school. I am
preparing my self for when I go to university. So I set myself **4** goals and
these goals must be met for me to use the system.

They are:

* Writing mathematical equations as fast (or faster) than my professor was an
  **A MUST**.
* Drawing the figures must be as **easy**, **fast**, and **simple**.
* It must feel like I am writing them on paper.
* My notes are very easily
  **manageable** and easy to **access**.

I will eventually have a ton of posts talking about this specific subject, but
for now, I will go over **Step 1**.

## NeoVim and LaTeX

**NeoVim** is a terminal-based text editor. It's just a better version of Vim,
which was made back in the 60s (I think).

I literally use NeoVim for everything. (You can find my custom NeoVim config
<a class="center after" href="https://www.github.com/SingularisArt/Death.NeoVim">here</a>).

**LaTeX** is a markup language used by mostly professors who want to publish
their papers. Also, nerds like me, spend countless weeks trying to figure out
the perfect setup for note-taking. Luckily, for you, you won't have to figure
anything out because I've done all of that for you.

Now, with that out of the way, here is what my screen looks like when I am
working with LaTeX:

![code-with-latex](/posts/images/note-taking-with-latex-part-1.png)

On the left side, I have my editor (**NeoVim**) and on the right side, I have
my pdf viewer **Zathura**.

Here is a quick list of all of my utilities:

* OS (Operating System):
  <a class="center after" href="https://www.archlinux.org/">**Arch Linux**</a>
* WM (Window Manager):
  <a class="center after" href="https://www.dwm.suckless.org/">**DWM**</a>
* Text Editor:
  <a class="center after" href="https://www.github.com/neovim/neovim">**NeoVim**</a>
* Pdf Viewer:
  <a class="center after" href="https://www.github.com/pwmt/zathura">**Zathura**</a>

I have a huge list of plugins that you can view
<a class="center after" href="https://www.github.com/SingularisArt/Death.NeoVim#all-of-my-plugins">here</a>), but
the plugin that I use for **LaTeX** is <a class="center after" href="https://www.github.com/lervag/vimtex">vimtex</a>. It provides:

* Syntax highlighting
* Auto compiling
* Renaming entire environments
* Shows you the toc (Table of Contents)

But, before I talk about how I configure NeoVim for **LaTeX**, let me explain to
you how I setup my NeoVim. This won't be an in depth tutorial (that will be in a
different post.)

For installing and managing plugins, I use the plugin manager
<a class="center after" href="https://www.github.com/wbthomason/packer">Packer</a>.
The reason I use it is because it's written in **Lua**, and **Lua** is much
faster than **Vimscript**. Now, if you want an in-depth tutorial on setting up
**Packer**, go <a class="center after" href="https://damrah.netlify.app/post/note-taking-with-latex-part-2">here</a>

Now, back to **LaTeX**, I use a gazillion plugins (You can view them all
<a class="center after" href="https://github.com/SingularisArt/Death.NeoVim/blob/master/lua/core/plugins.lua">here</a>),
but the most powerful one for **LaTeX** users is 
<a class="center after" href="https://www.github.com/lervag/vimtex">VimTex</a>. Here is how I installed it:

Add this line to your `plugins.lua` or wherever you put your plugins. But make
sure you source it in your `init.vim` or `init.lua`.

```lua
use { 'lervag/vimtex' }
```

If you don't use **Packer**, then replace the **use** with whatever your plugin
manager requires. Here's a quick example:

```viml
Plug 'lervag/vimtex'    " For vim-plug users
Plugin 'lervag/vimtex'  " For vundle users
```

If you use any of these lines, put it in your `plugins.vim`. But make sure you
source it in your `init.vim` or `init.lua`.

Add that to your `plugins.lua`, or wherever you place your plugins.

Now, time to configure it. Add this to your `init.vim` or `.vimrc`:

```viml
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
set conceallevel=1
```

The first line tells **VIMTEX** what pdf viewer you want to use to open your
pdf. Simple. The next line tells what kind of **LaTeX** you want to use to compile your document. The last line tell NeoVim to configure the concealment.
This is a feature that NeoVim uses to hide certain parts of the code if your
cursor isn't on it. It hides **\\[**, **\\]**, **$**. By making **\\[**,
**\\]**, **$** invisible, they aren't so distracting. Here's a quick demo:

![conceallevel](/posts/gifs/conceallevel.gif)

## Snippets

### What are Snippets

One of the major reasons why I'm so fast at typing when it comes to **LaTeX**,
is because of **snippets**.

A snippet is a short reusable piece of text that can be triggered by some other
text.

Then, you have **snippet managers**, which manages the **snippets** that you make.
There are many snippet managers out there, but I use
<a class="center after" href="https://www.github.com/SirVer/ultisnips">UltiSnippets</a>
as my **snippet manager**.

Now, you can have certain kind of **snippets** for certain kinds of languages.
For example, you might have **snippets** for python, while having different
**snippets** for **LaTeX**.

You can take a look over
<a class="center after" href="https://www.github.com/SingularisArt/Death.NeoVim/blob/UltiSnippets/tex.snippets">VimTehere</a> to see all of my **LaTeX snippets**, but I will be going over the most important
ones in this article.

### Installing Snippets

Like before, put this in `plugins.lua`, or wherever you keep your plugins at:

```lua
use { 'SirVer/ultisnips' }
use { 'honza/vim-snippets' }
use { 'hrsh7th/nvim-cmp' }

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
```

The first and second plugin are for snippets. The third one is to have the
snippets actually show. If you don't have the third plugin, then you won't be
able to see any auto-completion, snippets, lsp, etc. 

The lines after the plugins are just configuring the cmp plugin. You can view
the README [here](https://github.com/hrsh7th/nvim-cmp)

Now, just run:

```viml
:PackerInstall
```

Congrats, you have installed UltiSnippets.

Next section, I will go over how to add/modify snippets yourself.

### Adding Snippets

To add snippets, you first must configure `UltiSnips` itself. Now, add this to
you're `init.vim` or `.vimrc`:

```viml
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:UltiSnipsEditSplit='vertical'

let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips/']
```

Let's go over these quickly. The first line is telling `UltiSnips` what button
you want to use to expand the actual snippet. After you have expanded the
snippet, you have placeholders.

On line 2-3, you are telling `UltiSnips` what key presses you want to use to jump
back and forth between those placeholders.

The 4th line is telling `UltiSnips` to open the file vertically when you run
`:UltiSnipsEdit`.

The last and final line tells `UltiSnips` where to find your snippets.

#### Creating your own Snippets

Place your snippets in `~/.config/nvim/UltiSnips/` or wherever you told
`UltiSnips` to find theme. Each language has it's own specific snippet file. For
example, python snippets will be located at
`~/.config/nvim/UltiSnips/python.snippets`.

Or, instead of manually creating that file, open a file with that extension. For
example: `test.py`. Then, inside that file, type `:UltiSnipsEdit`. That will
create the file `~/.config/nvim/UltiSnips/python.snippets` for you.

Here is a basic skeleton for a snippet:

```viml
snippet SNIPPET NAME "SNIPPET DESCRIPTION"
...
endsnippet
```

To add placeholders, do this:

```viml
snippet document "Creates a document"
Document Name: $1
$0
endsnippet
```

The `$1` and `$0` are where your placeholders will be. The `$0` is always the
final placeholder. Now, you can create information within the placeholders like
this:

```viml
snippet document "Creates a document"
Document Name: ${1:DOCUMENT NAME}
$0
endsnippet
```

Now, the placeholder says **DOCUMENT NAME**, and when you reach that
placeholder, it will be highlighted in visual mode, and you can overwrite it.

Now you know the basics, let's get into some examples.

The code for this is probably the simplest.

![sign](/posts/gifs/sign.gif)

Here is the snippet code for it:

```viml
snippet sign "Signature"
Yours sincerely,

Hashem A. Damrah
endsnippet
```

Here's a bit more advanced snippet.

![box](/posts/gifs/box.gif)

```snippets
snippet box "Box"
`!p snip.rv = '┌' + '─' * (len(t[1]) + 2) + '┐'`
│ $1 │
`!p snip.rv = '└' + '─' * (len(t[1]) + 2) + '┘'`
$0
endsnippet
```

This time, instead of using bash to run, it's running `python` inside of the
`!p` tags.

Essentially, what it's doing is that it's trying to figure out how long the line
is, and adding the correct number of boxes around it.

You can also run shell commands inside snippets, but you have to use back ticks
(\`\`) for that.

![today](/posts/gifs/today-date.gif)

Here is the snippet code for it:

```viml
snippet date-time "Today's date and Current Time"
`date "+%b %d %Y %a %R`
endsnippet
```

You can even combine snippets:

![combine](/posts/gifs/combine.gif)

## LaTeX Snippets

### Environments

To insert an environment, all I have to do is type **beg**. I created this
snippet in a special manner. It only triggers whenever it's the first word
typed on the line. Also, you don't need to hit **TAB** because it will
automatically expand for you.

You start typing out what kind of environment you want. Then, once you're done,
hit tab. That will move you into the environment.

```viml
snippet beg "begin{} / end{}" bA
\begin{$1}
	${1:${VISUAL}}
\end{$1}
endsnippet
```

![environments](/posts/gifs/beg-environment.gif)

Now, I have a ton of different environments that I commonly use. So, like the
good programmer I am, I decided to waste even more time creating specific
snippets for each environment:

![environments](/posts/gifs/all-environments.gif)

Now, sometimes you may want to surround specific text with the environment. So,
what do you do? You can remove the text, create the environment, then paste.
That feels **WRONG**. As you all know, us programmers are the laziest people.
We spend hours trying to configure something to save us a couple of minutes.
And, guess what? That's exactly what I did. I read through the documentation to
learn about this (which took about 1.5 hours.)

It's called visual select tab. You highlight whatever you want, hit tab, then
go ahead and activate the snippet. There you go, the code you highlighted is
know surrounded with the environment you want!

```viml
snippet beg "begin{} / end{}" bAi
\begin{$1}
	$0${VISUAL}
\end{$1}
endsnippet

snippet doc "Document" bAi
\begin{document}
	$0${VISUAL}
\end{document}
endsnippet

snippet cnt "Center" bAi
\begin{center}
	$0${VISUAL}
\end{center}
endsnippet

snippet desc "Description" bAi
\begin{description}
	$0${VISUAL}
\end{description}
endsnippet

snippet lemma "Lemma" bAi
\begin{lemma}
	$0${VISUAL}
\end{lemma}
endsnippet

snippet prop "Proposition" bAi
\begin{prop}[$1]
	$0${VISUAL}
\end{prop}
endsnippet

snippet thrm "Theorem" bAi
\begin{theorem}[$1]
	$0${VISUAL}
\end{theorem}
endsnippet

snippet post "postulate" bAi
\begin{postulate}[$1]
	$0${VISUAL}
\end{postulate}
endsnippet

snippet prf "Proof" bAi
\begin{myproof}[$1]
	$0${VISUAL}
\end{myproof}
endsnippet

snippet def "Definition" bAi
\begin{definition}[$1]
	$0${VISUAL}
\end{definition}
endsnippet

snippet nte "Note" bAi
\begin{note}[$1]
	$0${VISUAL}
\end{note}
endsnippet

snippet prob "Problem" bAi
\begin{problem}[$1]
	$0${VISUAL}
\end{problem}
endsnippet

snippet corl "Corollary" bAi
\begin{corollary}[$1]
	$0${VISUAL}
\end{corollary}
endsnippet

snippet example "Example" bAi
\begin{example}[$1]
	$0${VISUAL}
\end{example}
endsnippet

snippet que "Question" bAi
\begin{question}[$1]
	$0${VISUAL}
\end{question}
endsnippet

snippet ans "Answer" bAi
\begin{answer}[$1]
	$0${VISUAL}
\end{answer}
endsnippet

snippet notion "Notation" bAi
\begin{notation}[$1]
	$0${VISUAL}
\end{notation}
endsnippet

snippet rep "Repetition" bAi
\begin{repetition}[$1]
	$0${VISUAL}
\end{repetition}
endsnippet

snippet prop "Property" bAi
\begin{property}[$1]
	$0${VISUAL}
\end{property}
endsnippet

snippet int "Intuition" bAi
\begin{intuition}[$1]
	$0${VISUAL}
\end{intuition}
endsnippet

snippet obs "Observation" bAi
\begin{observation}[$1]
	$0${VISUAL}
\end{observation}
endsnippet

snippet conc "Conclusion" bAi
\begin{conclusion}[$1]
	$0${VISUAL}
\end{conclusion}
endsnippet

snippet fig "Figure environment" bAi
\begin{figure}[${1:htpb}]
	\centering:${VISUAL}
	${2:\includegraphics[width=0.8\textwidth]{$3}}
	\caption{${4:$3}}
	\label{fig:${5:${3/\W+/-/g}}}
\end{figure}
endsnippet

snippet enum "Enumerate" bAi
\begin{enumerate}
	\item $0${VISUAL}
\end{enumerate}
endsnippet

snippet item "Itemize" bAi
\begin{itemize}
	\item $0${VISUAL}
\end{itemize}
endsnippet

snippet case "cases" bAi
\begin{cases}
	$0${VISUAL}
\end{cases}
endsnippet

snippet ali "Align" bAi
\begin{align}
	${1:${VISUAL}}
.\end{align}
endsnippet

snippet ali "Align*" bAi
\begin{align*}
	${1:${VISUAL}}
.\end{align*}
endsnippet

snippet abs "abstract environment" b
\begin{abstract}
	$0${VISUAL}
.\end{abstract}
endsnippet

snippet box "Box"
`!p snip.rv = '┌' + '─' * (len(t[1]) + 2) + '┐'`
│ $1 │
`!p snip.rv = '└' + '─' * (len(t[1]) + 2) + '┘'`
$0
endsnippet

snippet tab "tabular / array environment" b
	\begin{${1:t}${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}{${2:c}}
	$0${2/(?<=.)(c|l|r)|./(?1: & )/g}
	\end{$1${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}
endsnippet

snippet table "Table environment" b
\begin{table}[${1:htpb}]
	\centering
	\caption{${2:caption}}
	\label{tab:${3:label}}

	\begin{${4:t}${4/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}{${5:c}}
		$0${5/(?<=.)(c|l|r)|./(?1: & )/g}
	\end{$4${4/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}
\end{table}
endsnippet
```

* The **b** means **If the trigger word is the first word on the line, and no
writing comes afterword, then expand**.
* The **A** means **Expand without the trigger key, just expand right after the
person types the trigger word**.

### Inline and Display Math

These are my two most frequency used snippets. They are responsible for bringing
me into math mode. They are `im` (Inline Math) and `dm` (Display Math).

![inline-display](/posts/gifs/math.gif)

```viml
snippet im "Inline Math" wA
$${1}$`!p
if t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:
	snip.rv = ' '
else:
	snip.rv = ''
`$2
endsnippet

snippet dm "Display Math" wAb
\[
	${1:${VISUAL}}
.\] $0
endsnippet
```

The **A** at the end of the snippet declaration means it will expand as soon as
you type the key (`im`, `dm`). It doesn't wait for you to hit **tab**.

The **w** at the end of the first line means that this snippet will expand at
word boundaries. So, `helloim` won't expand, but `hello im` will.

The **b** means it won't expand unless it's at the beginning and the first word
on the line. So, `hello dm` won't expand, but `dm hello` will.

### Sub and Super scripts

#### Sub Scripts

Another handy snippet are these ones, which is used for sub scripts. It changes
a1 to a_1 and a_12 to a_{12} and a_{12}3 to a_{123}. It can also change
a_{123456789}0 to a_{1234567890}. Here, size doesn't matter!

![sub-scripts](/posts/gifs/sub-scripts.gif)

The code for these snippets use regular expressions for there trigger. The
first expands if there is a variable, followed by a number. Example **b3** ->
**b_3**. Here is the snippet code:

```viml
snippet '([A-Za-z])(\d)' "Auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet
```

The second snippet checks if there is a variable, followed by an
underscore, followed by two numbers. Example b_34 -> b_{34}.
Here is the snippet code:

```viml
snippet '([A-Za-z])_(\d\d)' "Auto subscript 2" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
endsnippet
```

The last and final snippet checks if there is a variable, followed by an
underscore, followed by a group of {} with numbers inside. It also checks if
there is a number in front of the closing bracket. Example b_{34}5 -> b_{345}

Here is the snippet code:

```viml
snippet '([A-Za-z])_\{(\d+)\}(\d)' "Auto subscript 3+" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2) + match.group(3)`}
endsnippet
```

I also created a quick snippet that puts you in **subscript** mode:

```viml
snippet __ "Super Script" Aw
_{$1}$0
endsnippet
```

#### Super Scripts

As for the superscripts, I use **td** -> **^{}**. However, I use some quick
snippets for basic things like squaring, cubing, raising to a variable.
Here is a quick view of the snippets:

* **sq** -> **^2**
* **cb** -> **^3**
* **ss** -> **^\{\}**
* **rd** -> **^\{()\}**
* **compl** -> **^\{c\}**
* **invs** -> **^\{-1\}**

![super-scripts](/posts/gifs/super-scripts.gif)

Here are the snippets:

```viml
snippet sq "Square" Aw
^2
endsnippet

snippet cb "Cube" Aw
^3
endsnippet

snippet ss "Super Script" Aw
^{$1}$0
endsnippet

snippet rd "To The ... Power" Aw
^{($1)}$0
endsnippet

snippet compl "Complement" Aw
^{c}
endsnippet

snippet invs "Inverse" Aw
^{-1}
endsnippet
```

### Fractions

These snippets, are the funniest and they give you a big satisfaction whenever
you pull them off.

![fractions](/posts/gifs/fractions.gif)

Now, let's start off with something very easy. Creating a simple fraction:

```viml
snippet // "Fraction" iA
\frac{$1}{$2}$0
endsnippet
```

The core of the second snippet is regular expressions. It's used to match
expressions like:
* \pi^{2}/
* 39_{9\Theta}/
* cf_2
* etc

```viml
snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wrA
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet
```

In the fourth case, I tried to find matching parenthesis. But, all of the work
went in vain because you cannot with `UltiSnips`. So, I used Python :).

```viml
priority 1000
snippet '^.*\)/' "() Fraction" wrA
`!p
stripped = match.string[:-1]
depth = 0
i = len(stripped) - 1
while True:
	if stripped[i] == ')': depth += 1
	if stripped[i] == '(': depth -= 1
	if depth == 0: break;
	i -= 1
snip.rv = stripped[0:i] + "\\frac{" + stripped[i+1:-1] + "}"
`{$1}$0
endsnippet
```

The last section that I want to show you is your selection to make your own
fraction using **visual mode**.

![tab-fraction](/posts/gifs/tab-fractions.gif)

```viml
snippet / "Fraction" iA
\\frac{${VISUAL}}{$1}$0
endsnippet
```

### School lessons

I don't really use these that often because I created scripts that do a lot of
work when:

* Organizing
* Changing
* Switching
* Loading
* Reloading

Between:

* Classes
* Lessons
* Lectures

You can find these scripts 
<a class="center after" href="https://www.github.com/SingularisArt/Singularis/tree/master/local/scripts/school">here</a>,
but eventually, I will create a blog post about how I made those scripts, how I
use them, etc.

![school-lessons](/posts/gifs/school-lessons.gif)

```viml
snippet les "Lesson"
\lesson{${1:LESSON NUMBER}}{`date "+%b %d %Y %a (%H:%M:%S)"`}{${3:LESSON NAME}}
$0
endsnippet

snippet lec "Lecture"
\lecture{${1:LECTURE NUMBER}}{`date "+%b %d %Y %a (%H:%M:%S)"`}{${3:LECTURE NAME}}
$0
endsnippet
```

### Correct spelling mistakes

I use this a **TON**. It's so handy because I don't have to leave insert mode,
hover over the word, press **z=**, select the correct word, then go all the way
back. UHHH, that was a lot of work! Also, if the word isn't corrected
correctly, I can exit insert mode, press **u**, and select the correct word,
and from now on, it will always be corrected to the correct one, which is the
one that I chose. AMAZING!

![school-lessons](/posts/gifs/correct-words.gif)

Now, put this in your `init.vim` or `.vimrc`:

```viml
setlocal spell
set spelllang=en
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u
```

## Auto completion

Now, besides `snippets` helping me out a ton when taking notes, I also have
`autocompletion`.

This is possible by using
<a class="center after" href="https://en.wikipedia.org/wiki/Language_Server_Protocol">LSP</a>.
`LSP` is a `language server protocol`, which allows me to get autocompletion,
suggestions, etc based on the language that I'm using.

### Setting LSP in NeoVim

First of all, paste this code in your `plugins.lua` (Notice, you may use a
different plugin manager):

```lua
use { 'neovim/nvim-lspconfig' } -- Main lsp plugin
use { 'onsails/lspkind-nvim' } -- Gives us icons
use { 'tami5/lspsaga.nvim', branch="nvim51" }
use { 'williamboman/nvim-lsp-installer' } -- Installs lsp servers
```

Now, restart NeoVim (by leaving and coming back) and run `:PackerSync`. That
will install those plugins for you.

### Install your language server

Installing your language server is super easy. For a complete list of all of
the language servers NeoVim offers, head over
<a class="center after"
href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a>.
To install your language server, just run `:LspInstall [lang name]`. Now, you
have your language server installed in NeoVim.

But, you need to server installed on your computer. To do that, head over
<a class="center after" href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a>
and find your language. Follow the link that they provide and install it from
there.

For example, I want to have the `python` language server. So, I just run
`:LspInstall python` in NeoVim. Then, I run `pip3 install
'python-lsp-server[all]'`. Now, I have my server.

To activate it `python`, put this in your `init.lua`:

```lua
require('lspconfig').pylsp.setup{}
```

But, for me, I have a ton of servers, and my goal is to only keep them growing.
So, here is a better way of doing it:

```lua
-- LSP Servers to install

local langservers = {
  'sumneko_lua',      -- Lua
  'vimls',            -- Vim
  'texlab',           -- LaTeX
  'pylsp',            -- Python
  'bashls',           -- Bash
  'clangd',           -- C++,C
  'cmake',            -- CMake
  'html',             -- HTML
  'cssls',            -- CSS
  'rust_analyzer',    -- Rust
  'tsserver',         -- Typescript/Javascript
  'yamlls',           -- Yaml
  'solidity_ls',      -- Solidity
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require('lspconfig')[server].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          }
        }
      }
    }
  else
    require('lspconfig')[server].setup {
      capabilities = capabilities
    }
  end
end
```

Inside of the `local langservers`, just add your server name and you're good to
go. For example, if I want to have the rust language server, just add
`rust_analyzer` to the langservers.

Again, you can get this information from
<a class="center after" href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a>.

#### Installing the Server for LaTeX

Since we're using NeoVim to take notes using `LaTeX`, then let's install the
`LaTeX` language server, which is `texlab`. You can view the source code
<a class="center after" href="https://github.com/latex-lsp/texlab">here</a>.
To install it, run the following command:

```bash
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

Now, add this line to your `init.lua`:

```lua
require('lspconfig').texlab.setup{}
```

Now, when you type `\`, you will be able to see autocompletion.

### Demo of LSP

<img src="/posts/gifs/latex-lsp.gif">

## Citation

### Download Zotero

For citation, you're going to need an extra tool. You're going to need the
program [Zotero](https://www.zotero.org/). Download this program. Then, create
an account with them. Don't worry, it's completely free, otherwise I wouldn't
have used it from the beginning.

This will help you create any citation for any:

* Website
* Book
* Movie

And you can choose any style you want. If you want **MLA** format, **Harvard**
format, etc. Let's go over a tutorial real quickly.

Here's how it looks like:

![zotero](/posts/images/zotero.png)

### Using Zotero

Now, to cite websites, you're going to need to download their google extension.
Download it from [here](https://chrome.google.com/webstore/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc?hl=en).

Open up the **Zotero** program. Go to **Edit > Preferences > Sync **. From
there, put in you're username and password from when you signed up with **Zotero**.

While still in the preferences, you can change the style of citation by clicking
the **Cite** section.

You can create citation by clicking the **+** icon and select the type.
You can also create different folders by left clicking the **My Library**
button. You can:

* Create Sub-Folder
* Delete Sub-Folder
* Sync

You can also cite from websites using the extension you downloaded earlier and
you can save the citation to a specific folder if you wish, but remember, all of
your citations will end up in the **My Library**, but copied to other
sub-folders.

Here's a quick demo of me using **Zotero**:

![demo-zotero](/posts/gifs/demo-zotero.gif)

### Auto-Complete Citations

> Be aware, if you want citation autocompletion, you must first install **LSP**.
> <a class="center after" href="https://damrah.netlify.app/post/note-taking-with-latex-part-1/#auto-completion">here</a>
> for a guide on how to do that.

To download your citations, just left-click the folder, and select
**Export Collection**. But, make sure to save it as a **.bib** file.

![export](/posts/images/export.png)

Make sure to save it as `bibliography.bib` and place it in the folder with your
`master.tex` file. Here's an example of a `bibliography.bib` file using the
**MLA** format:

```bib
@misc{noauthor_mathematics_2022,
	title = {Mathematics},
	copyright = {Creative Commons Attribution-ShareAlike License},
	url = {https://en.wikipedia.org/w/index.php?title=Mathematics&oldid=1066575364},
	abstract = {Mathematics (from Greek: μάθημα, máthēma, 'knowledge, study, learning') includes the study of such topics as numbers (arithmetic and number theory), formulas and related structures (algebra), shapes and spaces in which they are contained (geometry), and quantities and their changes (calculus and analysis). There is no general consensus about its exact scope or epistemological status.Most of mathematical activity consists of discovering and proving (by pure reasoning) properties of abstract objects. These objects are either abstractions from nature (such as natural numbers or "a line"), or (in modern mathematics) abstract entities that are defined by their basic properties, called axioms. A proof consists of a succession of applications of some deductive rules to already known results, including previously proved theorems, axioms and (in case of abstraction from nature) some basic properties that are considered as true starting points of the theory under consideration. The result of a proof is called a theorem. Contrary to scientific laws, the validity of a theorem (its truth) does not rely on any experimentation but on the correctness of its reasoning (though experimentation is often useful for discovering new theorems of interest).
Mathematics is widely used in science for modeling phenomena. This enables the extraction of quantitative predictions from experimental laws. For example, the movement of planets can be predicted with high accuracy using Newton's law of gravitation combined with mathematical computation. The independence of mathematical truth from any experimentation implies that the accuracy of such predictions depends only on the adequacy of the model for describing the reality. So when some inaccurate predictions arise, it means that the model must be improved or changed, not that the mathematics is wrong. For example, the perihelion precession of Mercury cannot be explained by Newton's law of gravitation, but is accurately explained by Einstein's general relativity. This experimental validation of Einstein's theory shows that Newton's law of gravitation is only an approximation (which still is very accurate in everyday life). 
Mathematics is essential in many fields, including natural sciences, engineering, medicine, finance, computer science and social sciences.
Some areas of mathematics, such as statistics and game theory, are developed in direct correlation with their applications, and are often grouped under the name of applied mathematics. Other mathematical areas are developed independently from any application (and are therefore called pure mathematics), but practical applications are often discovered later. A fitting example is the problem of integer factorization which goes back to Euclid but had no practical application before its use in the RSA cryptosystem (for the security of computer networks).
Mathematics has been a human activity from as far back as written records exist. However, the concept of a "proof" and its associated "mathematical rigour" first appeared in Greek mathematics, most notably in Euclid's Elements. Mathematics developed at a relatively slow pace until the Renaissance, when algebra and infinitesimal calculus were added to arithmetic and geometry as main areas of mathematics. Since then the interaction between mathematical innovations and scientific discoveries have led to a rapid increase in the rate of mathematical discoveries. At the end of the 19th century, the foundational crisis of mathematics led to the systematization of the axiomatic method. This, in turn, gave rise to a dramatic increase in the number of mathematics areas and their fields of applications; a witness of this is the Mathematics Subject Classification, which lists more than sixty first-level areas of mathematics.},
	language = {en},
	urldate = {2022-01-19},
	journal = {Wikipedia},
	month = jan,
	year = {2022},
	note = {Page Version ID: 1066575364},
	file = {Snapshot:/home/hashem/Zotero/storage/NYDPEYFR/Mathematics.html:text/html},
}
```

If you want NeoVim to autocomplete your citations for you, make sure to add this
to your **master.tex**:

```tex
\bibliography{bibliography}
```

Once you've added that, once you type:

```tex
\cite{
```

You will start to get autocompletions. Here's a demo:

![citation-completion](/posts/gifs/citation-completion.gif)

## Credit

I would like to give a thanks 👏 to
<a class="center after" href="https://www.castel.dev">Gilles Castel</a>
for teaching me all of this stuff. I would recommend to go and checkout his
website!

## Conclusion

So, I have just proven to you that you can write **LaTeX**

* **fast**
* **easily**
* **efficiently**

Stay tuned to learn about how I:

* **draw figures**
* **manage my notes**
* **take notes**

{{< video src="math" >}}
