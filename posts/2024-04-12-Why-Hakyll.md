---
title: Why Hakyll? And How It Stacks Up Against Other Static Site Generators...
author: Michael Shannon
---

You might already be familiar with the concept of static site generators—tools that help transform minimal written content into fully functional websites. Among these, particularly for those who dabble in [Haskell](https://www.haskell.org/ "Haskell"), Hakyll stands out. [Hakyll](https://jaspervdj.be/hakyll/ "Hakyll") combines the robustness of Haskell with the flexibility that you might crave for customizing your workflow.

Hakyll works by taking your content, often written in markdown or HTML, and processing it through a pipeline that you can tweak to your liking, transforming the content into static HTML files. What makes Hakyll truly special is its deep customization capabilities, courtesy of Haskell's expressive power. You can practically instruct Hakyll on every minute detail of how to handle different types of content, from markdown conversion to template application, making it a powerhouse for those who aren't satisfied with out-of-the-box solutions.

<img alt="Macaroni Hakyll Sketch Style" title="Hakyll" src="/images/hakyll-sketch.jpg" style="float:right; width:300px;"></a>

Comparing Hakyll to other popular static site generators like [Jekyll](https://jekyllrb.com/ "Jekyll") or [Hugo](https://gohugo.io/ "Hugo"), which are built in [Ruby](https://www.ruby-lang.org/en/ "Ruby") and [Go](https://go.dev/ "Go") respectively, sheds light on its unique position. Jekyll, for instance, is widely loved for its simplicity and the massive plugin ecosystem supported by Ruby. It’s ideal for those who want something that works straight out of the box and is easy to set up with GitHub Pages. Hugo, on the other hand, is renowned for its speed. Built with Go, it compiles sites at lightning-fast speeds, making it perfect for larger projects or for developers who value performance. (Performance isn't my first choice for a static site builder ... but to each their own.)

'Both Jekyll and Hugo, while powerful, offer less flexibility when it comes to deep customization compared to Hakyll. Hakyll’s use of Haskell allows not just for more complex manipulation but also brings the advantages of Haskell’s type system to the table, minimizing errors and enhancing flexability. This makes Hakyll a particularly attractive option for projects where precision and custom workflows are more critical than sheer speed or ease of use.

That said, for many the learning curve for Hakyll can be a bit steeper, primarily because Haskell has a very different idiom to imperative languages such as Ruby or Go. But for those already comfortable with Haskell or interested in leveraging its capabilities, Hakyll offers a level of control and customization that’s hard to match. It’s also worth noting that while Jekyll and Hugo are more straightforward for beginners, Hakyll provides a rewarding experience for those looking to leverage programming to dictate exactly how their website is constructed.

If you’re a developer looking for a static site generator that allows you to meticulously craft every aspect of your website, and if you’re comfortable with Haskell, Hakyll could be the perfect tool for you. It’s especially suitable for projects where detailed customization, and integration with Haskell-based systems are priorities. On the other hand, if speed and a gentle learning curve are what you’re after, or if you’re just starting out, you might find Jekyll or Hugo to be more up your alley.

Thanks for reading this,  
Mike 



