+++
title = 'Hugo 201: How to look cool and customize'
date = 2026-02-26T18:52:33-08:00
draft = false
+++

I recently had a fun experience fixing this website, which I figured I should share. I usually write on my Macbook, but I've been having battery trouble with it :(. Anyway, I had to setup my main workstation with Hugo, at which point I learned that the theme I was previously using, Mainroad, was deprecated. I rather liked it, but it had not been updated in several years by now. 

I decided I should try and find something a little more unique for this website. Thankfully, [Hugo has a list of themes publicly available](https://themes.gohugo.io/) which make it really easy to find one you like. They even show the date it was last updated so you can pick something recent!

I'll list a couple of the runner-ups before I go into why I picked the theme I did.

1. [Coder](https://themes.gohugo.io/themes/hugo-coder/): It looks pretty cool but unfortunately a little generic. I also thought the customization was a little weak.
2. [Terminal](https://themes.gohugo.io/themes/hugo-theme-terminal/) This looks so cool but I didn't feel like it was as professional as I'd like. The customization looks super cool though!
3. [BeautifulHugo](https://themes.gohugo.io/themes/beautifulhugo/) Similar to Coder, I thought this was just a little generic.

So what did I go with? I ended up settling on [hugo-theme-console](https://themes.gohugo.io/themes/hugo-theme-console/), which was not only simplistic but also eye-catching. It's even got a little cursor at the top!

One feature from Mainroad I liked was the ability to show social media links (mainly LinkedIn and Github). Unfortunately, that's not commonly supported by most themes, however customizing the theme to add it is actually quite easy.

## Customizing themes
Following the example of hugo-theme-console, you can override the theme's files by providing a copy within the `layouts` directory of the repository. For me, to add in my social media links, I needed to override the default page, at `layouts/index.html`, and the template for each page at `layouts/posts/single.html`. All I had to add was an `<a>` tag to create the link, and provide the URL of my account within my `hugo.toml` file. 

By overriding the default theme files, you can customize essentially any part of your website!
