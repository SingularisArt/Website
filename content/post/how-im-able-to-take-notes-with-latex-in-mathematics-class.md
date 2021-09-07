---
title:        "How I'm able to take notes with LaTeX in math class"
author:       "Hashem A. Damrah"
date:         2021-09-07T02:45:27-07:00
description:  "I go over using NeoVim and LaTeX to take notes with, but I specifically talk about talking notes with Mathematics"
tags:         ["school", "study habits", "study flows"]
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
to see all of my **LaTeX snippets**, but I will be going over the most important ones in this blob post.

### Sign

![sign](/posts/gifs/sign.gif)
```snippet
snippet sign "Signature"
Yours sincerely,

Hashem A. Damrah
endsnippet
```

### Today

![today](/posts/gifs/today.gif)

```snippet
snippet today "Date"
`date +%F`
endsnippet
```

### Environments

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

![inline-display](/posts/gifs/inline-display.gif)

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

### Fractions

![fractions](/posts/gifs/fractions.gif)

```snippet
snippet // "Fraction" iA
\frac{$1}{$2}$0
endsnippet

snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wrA
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet

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

### Sub and Super scripts

![sub-super-scripts](/posts/gifs/sub-super-scripts.gif)

```snippet
snippet '([A-Za-z])(\d)' "Auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet

snippet '([A-Za-z])_(\d\d)' "Auto subscript 2" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
endsnippet

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
Stay tuned to learn about:
* How I **draw figures**
* How I **manage my notes**
* How I **take notes**
