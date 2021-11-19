---
title:        	"Note Taking with LaTeX: Part 1"
author:       	"Hashem A. Damrah"
introduction: 	"This post talks about how I take notes with LaTeX: Part 1"
date:         	2021-09-07T02:45:27-07:00
description:  	"I go over using NeoVim and LaTeX to take notes with, but I specifically talk about talking notes with Mathematics"
draft: 		 	false
comments:		true
cover:			"/posts/images/code-with-latex.png"
toc:			true
tags:         	["note taking", "series"]
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
for now, I will go over
**step 1 (Writing mathematical equations as fast (or faster) than my professor was an A MUST.)**

## NeoVim and LaTeX

Quickly, what is NeoVim.

NeoVim is a **fork** of Vim.
For writing my **notes**, I use NeoVim
(You can find my custom NeoVim config
<a class="center after" href="https://www.github.com/SingularisArt/Death.NeoVim">here</a>).
Later on, I will create a blog post talking about how I setup my NeoVim setup.

I literally use NeoVim for everything. I use it to write **LaTeX**,
**markdown**, **actual code**. A
lot of people complain saying **"Vim is to hard to learn and it's weird"**, but
trust me, once you learn it, you can ***NEVER UN-LEARN IT***, it saves you
***HOURS OF TYPING***, and feels ***AMAZING WHEN YOU'RE IN IT***.
But, yes, it does have a steep learning curve, but after you learn it, you
will be rewarded.

Now, with that out of the way, here is what my screen looks like when I am
working with LaTeX:

![code-with-latex](/posts/images/code-with-latex.png)

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

But, before I talk about how I configure NeoVim for **LaTeX**, let me explain to you how I setup my NeoVim. This won't be an in depth tutorial (that will be in a different post.)

For installing NeoVim Plugins, I use <a class="center after" href="https://www.github.com/wbthomason/packer">Packer</a>, which is a plugin-manager written in **lua**. It only works in NeoVim because vim doesn't support **lua** (because **VIM SUCKS** only **NEOVIM RULES**.) So, if you are unsure, go here (I will update this when I post a blog post about my NeoVim setup, until then, **WAIT 😭**.)

Now, back to **LaTeX**, I use a gazillion plugins, but the most powerful one for **LaTeX** users is 
<a class="center after" href="https://www.github.com/lervag/vimtex">VimTex</a>. Here is how I installed it:

```lua
use { 'lervag/vimtex' } " If you use packer
```

Add that to your `plugins.lua`, or wherever you place your plugins.

Now, time to configure it. Add this to your `init.vim` or `.vimrc`:

```viml
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
set conceallevel=1
```

The first line tells **VIMTEX** what pdf viewer you want to use to open your pdf. Simple.
The next line tells what kind of **LaTeX** you want to use to compile your document.
The last line tell NeoVim to configure the concealment. This is a feature that NeoVim uses to hide certain
parts of the code if your cursor isn't on it. It hides **\\[**, **\\]**, **$**. By making **\\[**, **\\]**, **$**
invisible, they aren't so distracting.

![conceallevel](/posts/gifs/conceallevel.gif)

## Snippets

One of the major reasons why I'm so fast at typing when it comes to **LaTeX**,
is because of **snippets**.

A snippet is a short reusable piece of text that can be triggered by some other text.

Then, you have **snippet managers**, which manages the **snippets** that you make.
There are many snippet managers out there, but I use
<a class="center after" href="https://www.github.com/SirVer/ultisnips">UltiSnippets</a>
as my **snippet manager**.

Now, you can have certain kind of **snippets** for certain kinds of languages.
For example, you might have **snippets** for python, while having different
**snippets** for **LaTeX**.

You can take a look over
<a class="center after" href="https://www.github.com/SingularisArt/Death.NeoVim/blob/UltiSnippets/tex.snippets">VimTehere</a>
to see all of my **LaTeX snippets**, but I will be going over the most important ones in this article.

### Installing Snippets

Like before, put this in `plugins.lua`, or wherever you keep your plugins at:

```lua
use { 'https://github.com/SirVer/ultisnips' } " If you use packer
```

After you install that, now run:

```viml
:PackerInstall  " If you use packer
```

Congrats, you have installed UltiSnippets. Now, to start us off, let's install some snippets, that we can later on configure. To do that we need to install another plugin:

```lua
use { 'https://github.com/honza/vim-snippets' }         " If you use packer
```

Next section, I will go over how to add/modify snippets yourself.

### Adding snippets

To add snippets, you first must configure `UltiSnips` itself. Now, add this to you're `init.vim` or `.vimrc`:

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

#### Creating your own snippets

Place your snippets in `~/.config/nvim/UltiSnips/` or wherever you told `UltiSnips` to find theme. Each language has it's own specific snippet file. For example, python snippets will be located at `~/.config/nvim/UltiSnips/python.snippets`.

Or, instead of manually creating that file, open a file with that extension. For example: `test.py`. Then, inside that file, type `:UltiSnipsEdit`. That will create the file `~/.config/nvim/UltiSnips/python.snippets` for you.

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

The `$1` and `$0` are where your placeholders will be. The `$0` is always the final placeholder. Now, you can create information within the placeholders like this:

```viml
snippet document "Creates a document"
Document Name: ${1:DOCUMENT NAME}
$0
endsnippet
```

Now, the placeholder says **DOCUMENT NAME**, and when you reach that placeholder, it will be highlighted in visual mode, and you can overwrite it.

Now you know the basics, let's get into some examples.

### Sign

The code for this is probably the simplest.

![sign](/posts/gifs/sign.gif)

Here is the snippet code for it:

```viml
snippet sign "Signature"
Yours sincerely,

Hashem A. Damrah
endsnippet
```

### Today and Date

You can also run shell commands inside snippets, but you have to use back ticks
(\`\`) for that.

![today](/posts/gifs/today-date.gif)

Here is the snippet code for it:

```viml
snippet date-time "Today's date and Current Time"
`date "+%b %d %Y %a %R`
endsnippet
```

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
know surrounded with the environment you want! 😮‍💨

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

snippet ali "Align*" bAi
\begin{align*}
	${1:${VISUAL}}
.\end{align*}
endsnippet

snippet ali "Align" bAi
\begin{align}
	${1:${VISUAL}}
.\end{align}
endsnippet
```

* The **b** means **If the trigger word is the first word on the line, and no
writing comes afterword, then expand**.
* The **A** means **Expand without the trigger key, just expand right after the
person types the trigger word**.

### Inline and Display Math

These are my two most frequency used snippets. They are responsible for bringing me into math mode. They are `im` (Inline Math) and `dm` (Display Math).

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

The last and final snippet checks if there is a variable, followed by an underscore,
followed by a group of {} with numbers inside. It also checks if there is a
number in front of the closing bracket. Example b_{34}5 -> b_{345}

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

These snippets, are the funniest and they give you a big satisfaction whenever you pull them off.

![fractions](/posts/gifs/fractions.gif)

Now, let's start off with something very easy. Creating a simple fraction:

```viml
snippet // "Fraction" iA
\frac{$1}{$2}$0
endsnippet
```

The core of the second snippet is regular expressions. It's used to match expressions like:
* \pi^{2}/
* 39_{9\Theta}/
* cf_2
* etc

```viml
snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wrA
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet
```

In the fourth case, I tried to find matching parenthesis. But, all of the work went in vain because you cannot with `UltiSnips`. So, I used Python :).

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

The last section that I want to show you is your selection to make your own fraction using **visual mode**.

![tab-fraction](/posts/gifs/tab-fractions.gif)

```viml
snippet / "Fraction" iA
\\frac{${VISUAL}}{$1}$0
endsnippet
```

### School lessons

I don't really use these that often because I created scripts that do a lot of work when:

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

## Autocompletion

Now, besides `snippets` helping me out a ton when taking notes, I also have `autocompletion`.

This is possible by using <a class="center after" href="https://en.wikipedia.org/wiki/Language_Server_Protocol">LSP</a>. `LSP` is a `language server protocol`, which allows me to get autocompletion, suggestions, etc based on the language that I'm using.

### Setting LSP in NeoVim

First of all, paste this code in your `plugins.lua` (Notice, you may use a different plugin manager):

```lua
use { 'neovim/nvim-lspconfig' }
use { 'tamago324/nlsp-settings.nvim' }
use { 'jose-elias-alvarez/null-ls.nvim' }
use { 'kabouzeid/nvim-lspinstall' }
use { 'onsails/lspkind-nvim' }
```

Now, restart NeoVim (by leaving and coming back) and run `:PackerSync`. That will install those plugins for you.

### Install your language server

Installing your language server is super easy. For a complete list of all of
the language servers NeoVim offers, head over
<a class="center after" href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a>. To install your language server, just run `:LspInstall [lang name]`. Now, you
have your language server installed in NeoVim.

But, you need to server installed on your computer. To do that, head over
<a class="center after" href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a>
and find your language. Follow the link that they provide and install it from
there.

For example, I want to have the `python` language server. So, I just run `:LspInstall python` in NeoVim. Then, I run `pip3 install 'python-lsp-server[all]'`. Now, I have my server.

To activate it `python`, put this in your `init.lua`:

```lua
require('lspconfig').pylsp.setup{}
```

But, for me, I have a ton of servers, and my goal is to only keep them growing.
So, here is a better way of doing it:

```lua
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Language Servers
local langservers = {
  'html',
  'cssls',
  'tsserver',
  'pylsp',
  'ls_emmet',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
	require'lspconfig'[server].setup {
		capabilities = capabilities
	}
end
```

Inside of the `local langservers`, just add your server name and you're good to
go. For example, if I want to have the rust language server, it becomes this:

```lua
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Language Servers
local langservers = {
  'html',
  'cssls',
  'tsserver',
  'pylsp',
  'ls_emmet',
  'sumneko_lua',
  'rust_analyzer'
}

for _, server in ipairs(langservers) do
	require'lspconfig'[server].setup {
		capabilities = capabilities
	}
end
```

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

### Gifs of me using LSP

<figure>
<img src="/posts/gifs/latex-lsp.gif">
<figcaption align="center"><b>LaTeX LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/vim-lsp.gif">
<figcaption align="center"><b>Vimscript LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/lua-lsp.gif">
<figcaption align="center"><b>Lua LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/rust-lsp.gif">
<figcaption align="center"><b>Rust LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/c-lsp.gif">
<figcaption align="center"><b>C LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/cpp-lsp.gif">
<figcaption align="center"><b>C++ LSP</b></figcaption>
</figure>

<figure>
<img src="/posts/gifs/python-lsp.gif">
<figcaption align="center"><b>Python LSP</b></figcaption>
</figure>

## Credit

I would like to give a thanks 👏 to
<a class="center after" href="https://www.castel.dev">Gilles Castel</a>
for teaching me all of this stuff. I would recommend to go and checkout his website!

## Conclusion

So, I have just proven to you that you can write **LaTeX**
* **fast**
* **easily**
* **efficiently**

Stay tuned to learn about how I:
* **draw figures**
* **manage my notes**
* **take notes**
