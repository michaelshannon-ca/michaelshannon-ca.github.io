---
title: Rambling about my fumblings with Haskell, Hakyll and Github.io
author: Michael Shannon
---

Well, it was time to get with this millenium and contribute to the communal realm by publishing my follies publically.
I'm not ready for the quagmire that is social media ( I still see it as an excessive sacrifice of privacy
that brings more harm than good ) but I wanted to proffer my own experiences to the public discourse.
Truth be told, even this is more public than I'm completely comfortable with.

None the less, I wasn't ready to give my bits and bytes to other platforms and I waste too much of my life
maintaning web-ish infrastructure for other projects so the free hosting available via GitHub.io was key.
And, since I enjoy [Haskell](https://www.haskell.org/ "Haskell"), [Hakyll](https://jaspervdj.be/hakyll/ "Hakyll") was my chosen alternative to the dominate [Jekyll](https://jekyllrb.com/ "Jekyll").

It wasn't the smoothest ride. In attempting to be "with it" and update to the current Haskell ways I installed [GHCup](https://www.haskell.org/ghcup/ "GHCup") and promptly ran into the dreaded [Macports](https://www.macports.org/ "Macports") and Haskell "libiconv port function name manglingi collision with Haskell problem" which manifests itself as:
`...
Linking dist/build/hakyll-init/hakyll-init ...
Undefined symbols for architecture x86_64:
  "_iconv", referenced from:
      _hs_iconv in libHSbase-4.16.4.0.a(iconv.o)
      ...`

More detailed explanatios as to what are happening are available [here](https://stackoverflow.com/questions/57734434/libiconv-or-iconv-undefined-symbol-on-mac-osx), [here](https://trac.macports.org/ticket/57821), [here](https://trac.macports.org/ticket/61222) and [here](https://gitlab.haskell.org/ghc/ghc/-/issues/18743).

Hakyll was nice and straight forward and with the help of the following postings:
- [official tutorial](https://jaspervdj.be/hakyll/tutorials/01-installation.html)
- [more detailed tutorial](https://robertwpearce.com/hakyll-pt-1-setup-initial-customization.html)
- [an example of using Hakyll with Github.io](https://thma.github.io/posts/2020-11-15-using-hakyll-with-github-pages.html)
- [how to copy CNAME and robots.txt to your docs/](https://robertwpearce.com/hakyll-pt-4-copying-static-files-for-your-build.html)
- [and a layout I wanted to shamelessly copy](https://charukiewi.cz/)
... I was off to the races.

Why even post this? Well, I wanted to play with Hakyll a bit more and I need some content to populate my "posts/" section of this site.

Thanks for reading this,  
Mike 



