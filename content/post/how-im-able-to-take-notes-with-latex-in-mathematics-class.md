---
title:        "How I'm able to take notes with LaTeX in math class"
author:       "Hashem A. Damrah"
date:         2021-09-07T02:45:27-07:00
description:  "I go over using NeoVim and LaTeX to take notes with, but I specifically talk about talking notes with Mathematics"
tags:         ["school", "study habits", "study flows"]
cover:        "posts/images/code-with-latex.png"
---

For a **very long time**, I have been trying to create the perfect setup for
note taking in general (but more specifically, for **math**). Before, I used to
use [notion](https://notion.so) to take my notes, which was okay, but I wanted
something much more productive. And thus, my system was **BORN**!

If you want to see how my notes look like now, go
[here](https://damrah.netlify.app/notes). I also store all of my notes
[here](https://github.com/SingularisArt/notes).

I created this method after the summer finished **9th grade**. I am preparing my self
for when I go to university. So I set myself **3** goals:
* Writing mathematical equations as fast (or faster) than my professor was an
  **A MUST**.
* Drawing the figures must be as **easy**, **fast**, **simple**
* and must feel like I am writing them on paper.  My notes are very easily
  **manageable** and easy to **access**.

I will eventually have a ton of posts talking about this specific subject, but
for now, I will go over **step 1**.

## NeoVim and LaTeX

Quickly, NeoVim is a **fork** of Vim. \
For writing my **notes**, I use NeoVim
(You can find my custom [NeoVim](https://github.com/SingularisArt/Death.NeoVim) config
[here](https://github.com/SingularisArt/Death.NeoVim).) I literally use NeoVim
for everything. I use it to write **LaTeX**, **markdown**, **actual code**. A
lot of people complain saying **"Vim is to hard to learn and it's weird"**, but
trust me. Yes, it does have a steep learning curve, but after you learn it, you
will be rewarded. Here is what my screen looks like when I am working with LaTeX:

![code-with-latex](/posts/images/code-with-latex.png)

On the left side, I have my editor (**NeoVim**) and on the right side, I have
my pdf viewer **Zathura** (You can find my custom **Zathura** config
[here](https://github.com/SingularisArt/Singularis).) Here is a quick list of all of my utilities:
* OS: Linux Ubuntu
* WM: DWM
* EDITOR: [NeoVim](https://github.com/SingularisArt/Death.NeoVim)
* PDF VIEWER: [Zathura](https://github.com/SingularisArt/Singularis)

I have a huge list of plugins that you can view
[here](https://github.com/SingularisArt/Death.NeoVim#all-of-my-plugins), but
the plugin that I use for **LaTeX** is [vimtex](https://github.com/lervag/vimtex). It provides:
* Syntax highlighting
* Auto compiling
* Renaming entire environments
* Shows you the toc (Table of Contents)

I use the [Packer Plugin Manager](https://github.com/wbthomason/packer.nvim).
So, here is how you install it:

```viml
use { 'lervag/vimtex' } " If you are using packer
Plug 'lervag/vimtex'    " If you are using vim-plug
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
set conceallevel=1
```

The last two lines tell tell
[NeoVim](https://github.com/SingularisArt/Death.NeoVim) to configure the
concealment. This is a feature that
[NeoVim](https://github.com/SingularisArt/Death.NeoVim) uses to hide certain
parts of the code if your cursor isn't on it. By making **\\[**, **\\]**, **$**
invisible, they aren't in the way, so you can better see the entire document.
Also, it tries it's best to show you what it will look like when you compile
the file. Here
is a quick demonstration:

![conceallevel](/posts/gifs/conceallevel.gif)

## UltiSnippets

One of the major reasons why I'm so fast at typing when it comes to **LaTeX**,
is because of **snippets**. A snippet is a short reusable piece of text that
can be triggered by some other text. Then, you have **snippet managers**, which
manages the **snippets** that you make. I use
[UltiSnippets](https://github.com/SirVer/ultisnips) as my **snippet** manager.

Now, you can have certain kind of **snippets** for certain kinds of languages. For example, you might have **snippets** for python, while having different **snippets** for **LaTeX**.

You can take a look over
[here](https://github.com/SingularisArt/Death.NeoVim/blob/UltiSnippets/tex.snippets)
to see all of my **LaTeX snippets**, but I will be going over the most important ones in this article.

### Install Snippets

To install snippets, you first need a snippet manager. I use [UltiSnippets](https://github.com/SirVer/ultisnips) for that. To install it, put these commands in your .vimrc, init.vim, or init.lua:

```viml
use { 'https://github.com/SirVer/ultisnips' } " If you use packer
Plug 'https://github.com/SirVer/ultisnips'    " If you use vim-plug
```

After you install that, now run:

```viml
:PackerInstall  " If you are using packer
:PlugInstall    " If you are using vim-plug
```

Congrats, you have installed UltiSnippets. Now, to start us off, let's install some snippets, that we can later on configure. To do that we need to install another plugin:

```viml
use { 'https://github.com/honza/vim-snippets' }         " If you use packer
Plug 'https://github.com/SirVer/honza/vim-snippets'     " If you use vim-plug
```

Next section, I will go over how to add snippets yourself.

### Adding snippets

To add snippets, you first must configure UltiSnips itself. Now, add this to you're .vimrc or init.vim:

```snippet
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:UltiSnipsEditSplit='vertical'

let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips/']
```

Let's go over these quickly. The first line is telling UltiSnips what button you want to use to expand the actual snippet. After you have expanded the snippet, you have placeholders. On line 2-3, you are telling UltiSnips what key presses you want to use to jump back and forth between those placeholders. The 4th line is telling UltiSnips to open the file vertically when you run `:UltiSnipsEdit`. The last and final line tells UltiSnips where to find your snippets.

#### Creating your own snippets

Place your snippets in `~/.config/nvim/UltiSnips/` or wherever you told UltiSnips to find theme. Each language has it's own specific snippet file. For example, python snippets will be located at `~/.config/nvim/UltiSnips/python.snippets`. Or, instead of manually creating that file, open a file with that extension. For example: `test.py`. Then, inside that file, type `:UltiSnipsEdit`. That will create the file `~/.config/nvim/UltiSnips/python.snippets` for you.

Here is a basic skeleton for a snippet:

```snippet
snippet SNIPPET NAME "SNIPPET DESCRIPTION"
...
endsnippet
```

To add placeholders, do this:

```snippet
snippet document "Creates a document"
Document Name: $1
$0
endsnippet
```

The `$1` and `$0` are where your placeholders will be. The `$0` is always the final placeholder. Now, you can create information within the placeholders like this:

```snippet
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

```snippet
snippet sign "Signature"
Yours sincerely,

Hashem A. Damrah
endsnippet
```

### Today and Date

You can also run shell commands inside snippets, but you have to use back ticks (\`\`) for that.

![today](/posts/gifs/today-date.gif)

Here is how the snippets look like:

```snippet
snippet date-time "Today's date and Current Time"
`date "+%b %d %Y %a %R`
endsnippet
```

### Environments

To insert an environment, all I have to do is type **beg**, then hit **tab**.
You start typing out what kind of environment you want. Then, once you're done,
hit tab. That will move you into the environment.

Now, I use a lot of different
environments, and I've even created some. So, I created different kind of
snippets for different environments. The code for it is down below.

![environments](/posts/gifs/environments.gif)

```snippet
snippet beg "begin{} / end{}" b
\begin{$1}
	$0
\end{$1}
endsnippet

snippet doc "Document" b
\begin{document}
	$0
\end{document}
endsnippet

snippet cnt "Center" b
\begin{center}
	$1
\end{center}
endsnippet

snippet itm "Itemize" b
\begin{itemize}
	\item $0
\end{itemize}
endsnippet

snippet desc "Description" b
\begin{description}
	$1
\end{description}
endsnippet

snippet lemma "Lemma" b
\begin{lemma}
	$1
\end{lemma}
endsnippet

snippet prop "Proposition" b
\begin{prop}[$1]
	$2
\end{prop}
endsnippet

snippet theorem "Theorem" b
\begin{theorem}[$1]
	$2
\end{theorem}
endsnippet

snippet postulate "postulate" b
\begin{postulate}[$1]
	$2
\end{postulate}
endsnippet

snippet myproof "Proof" b
\begin{myproof}[$1]
	$2
\end{myproof}
endsnippet

snippet definition "Definition" b
\begin{definition}[$1]
	$2
\end{definition}
endsnippet

snippet note "Note" b
\begin{note}[$1]
	$2
\end{note}
endsnippet

snippet problem "Problem" b
\begin{problem}[$1]
	$2
\end{problem}
endsnippet

snippet corollary "Corollary" b
\begin{corollary}[$1]
	$2
\end{corollary}
endsnippet

snippet example "Example" b
\begin{example}[$1]
	$2
\end{example}
endsnippet

snippet notation "Notation" b
\begin{notation}[$1]
	$2
\end{notation}
endsnippet

snippet repetition "Repetition" b
\begin{repetition}[$1]
	$2
\end{repetition}
endsnippet

snippet property "Property" b
\begin{property}[$1]
	$2
\end{property}
endsnippet

snippet intuition "Intuition" b
\begin{intuition}[$1]
	$2
\end{intuition}
endsnippet

snippet observation "Observation" b
\begin{observation}[$1]
	$2
\end{observation}
endsnippet

snippet conclusion "Conclusion" b
\begin{conclusion}[$1]
	$2
\end{conclusion}
endsnippet
```

### Inline and Display Math

These are my two most frequency used snippets. They are responsible for bringing me into math mode. They are `im` (Inline Math) and `dm` (Display Math).

![inline-display](/posts/gifs/inline-math.gif)

```snippet
snippet im "Inline Math" wA
$${1}$`!p
if t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:
	snip.rv = ' '
else:
	snip.rv = ''
`$2
endsnippet

snippet dm "Display Math" wA
\[
${1:${VISUAL}}
.\] $0
endsnippet
```

The **A** at the end of the snippet declaration means it will expand as soon as
you type the key (`im`, `dm`). It doesn't wait for you to hit **tab**.  The
**w** at the end of the first line means that this snippet will expand at word
boundaries. So, `helloim` won't expand, but `hello im` will.

### Sub and Super scripts

Another handy snippet is this one, which is used for sub scripts. It changes
a1 to a_1 and a_12 to a_{12} and a_{12}3 to
a_{123}. It can also change a_{123456789}0 to a_{1234567890}.
Here, size doesn't matter!

![sub-scripts](/posts/gifs/sub-scripts.gif)

The code for these snippets use regular expressions for there trigger. The
first expands if there is a variable, followed by a number. Example **b3** ->
**b_3**.

The second snippet checks if there is a variable, followed by an
underscore, followed by two numbers. Example b_34 -> b_{34}.

The last and final snippet checks if there is a variable, followed by an underscore,
followed by a group of {} with numbers inside. It also checks if there is a
number in front of the closing bracket. Example b_{34}5 -> b_{345}

Here is the snippet code:

```snippet
snippet '([A-Za-z])(\d)' "Auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet

snippet '([A-Za-z])_(\d\d)' "Auto subscript 2" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
endsnippet

snippet '([A-Za-z])_\{(\d+)\}(\d)' "Auto subscript 3+" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2) + match.group(3)`}
endsnippet
```

Whenever you wrap parts of a regular expression in parenthesis, ex **(\d\d)**, you can use them in the expansion of the snippet via **math.group(i)**.

As for the superscripts, I use **td** -> **^{}**. However, I use some quick snippets for basic things like squaring, cubing, raising to a variable.
Here is a quick view of the snippets:
* **td** -> **^{}**
* **sq** -> **^2**
* **cb** -> **^3**
* **compl** -> **^{c}**
* **ss** -> **^{$1}$0**

![super-scripts](/posts/gifs/super-scripts.gif)

Here is the snippet code:
```snippet
snippet sq "Square" i
^2
endsnippet

snippet cb "Square" i
^3
endsnippet

snippet compl "Complement" i
^{c}
endsnippet

snippet ss "Super Script" i
^{$1}$0
endsnippet
```

### Fractions

These snippets, are the funniest and they give you a big satisfaction whenever you pull them off.

Here is my goal. To be able to perform snippets on these:

                                //  ->  \frac{}{}
                                3/  ->  \frac{3}{}
                            4\i^2/  -> \frac{4\pi^2}{}
                       (1 + 2 + 3)  ->  \frac{(1 + 2 + 3)}{}
                    (1 + (2 + 3)/)  ->  (1 + \frac{(1 + 2))}{}
                    (1 + (2 + 3))/  ->  \frac{1 + (2 + 3)}{}

![fractions](/posts/gifs/fractions.gif)

Now, let's start off with something very easy. Creating a simple fraction:

```snippet
snippet // "Fraction" iA
\frac{$1}{$2}$0
endsnippet
```

The core of the second snippet is regular expressions. It's used to match expressions like:
* \pi^{2}/
* 39_{9\Theta}/
* cf_2
* etc

```snippet
snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wrA
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet
```

In the fourth case, I tried to find matching parenthesis. But, all of the work went in vain because you cannot with UltiSnips. So, I used Python :).

```snippet
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

![tab-fraction](/posts/gifs/tab-fraction.gif)

```snippet
snippet / "Fraction" iA
\\frac{${VISUAL}}{$1}$0
endsnippet
```

### Template

![template](/posts/gifs/template.gif)

```snippet
snippet template "Template"
\documentclass{article}

\usepackage{import}
\usepackage{pdfpages}
\usepackage{transparent}
\usepackage{xcolor}
$1

\newcommand{\incfig}[2][1]{%
		\def\svgwidth{#1\columnwidth}
		\import{./figures/}{###pdf_tex}
}
$2
\pdfsuppresswarningpagegroup=1

\begin{document}
		$0
\end{document}
endsnippet
```

### School lessons

![school-lessons](/posts/gifs/school-lessons.gif)

```snippet
snippet les "Lesson"
\lesson{${1:LESSON NUMBER}}{${2:DATE AND TIME}}{${3:LESSON NAME}}
$0
endsnippet

snippet lec "Lecture"
\lesson{${1:LECTURE NUMBER}}{${2:DATE AND TIME}}{${3:LECTURE NAME}}
$0
endsnippet
```

### Correct spelling mistakes

```viml
setlocal spell
set spelllang=en
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u
```

## Credit

I would like to give a thanks :clap: to [Gilles Castel](https://castel.dev) for teaching me all of this stuff. I would recommend to go and checkout his website!

## Conclusion

So, I have just proven to you that you can write **LaTeX** fast, easily, and efficiently.
Stay tuned to learn about how I:
* **draw figures**
* **manage my notes**
* **take notes**
