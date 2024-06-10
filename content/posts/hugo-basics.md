+++
title = 'Learning Hugo or: How I Learned to Stop Worrying and Love Static Site Generation'
date = 2024-06-08T19:40:57-07:00
draft = false
+++
When I first started my blog shortly after graduating from college, I thought it would be so cool to make it myself. What does *make it yourself* mean? Well, I found a premade HTML template online, plugged in some pictures, changed some of the words, and let it rip. 

It sucked. Both practically, in the sense that it looked lke shit, and as a portfolio, in the sense that it looked like shit **and** it didn't demonstrate anything about my skills.

![Picture of my previous site](/img/oldwebsite.png)

Like come on, what is this? Looks awful. Not a fan besties.

### Who am I?
Let me be clear. I'm not a web developer. So, showcasing my web development skills is not what I am looking for. I don't want to learn Javascript. I did a bit in school and a bit for personal projects, but I did not like it. There are so many other interesting things to be doing, why would you spend your life writing Javascript slop?

### What do I need in a website
I need something to help me showcase *everything* else I do. I need a small lightweight website that is easy to maintain, that has no functionality beyond basic navigation, that can let me modify static sites with simple syntax, and perhaps most importantly, can easily by hosted on Github Pages for free (I'm cheap).

### Static site generators
The idea is simple. Don't write HTML. Don't write CSS. Don't write Javascript. Simply write up your content in whatever way your engine accepts, and it'll spit it out. Perfect for documentation, news, product pages, blogs, and lazy people (And often lazy people with blogs).

There's probably 4 big SSG's on the market. I chose Hugo for this, but due to the nature of SSG, any of them could do this. I like Go more than Python or Ruby. 

### How did I used to make my website
On my old site, I had to basically copy and paste blobs of HTML around in order to add new entries on the main page. This of course, is not expandable, and is not fun.

### How do I make posts now?
Literally one line.

`hugo new content posts/example/example.md`

You put all your images and files in the "example" folder.

Then you start typing. You can spend more time doing the things you want to do, and saying the things you want to say. And you don't have to touch Javascript. Not even once.

# Links and References
- [Hugo Quickstart Guide](https://gohugo.io/getting-started/quick-start/)
- [Mainroad: The Hugo Theme I used.](https://github.com/Vimux/Mainroad)
