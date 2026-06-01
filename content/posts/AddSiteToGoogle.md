+++
title = 'How to add your site to Google'
date = 2026-06-01T13:53:18-07:00
draft = false
+++

Once I've started writing more, I've found new issues with my site. One of these is that searching for a specific post becomes rather hard. This snowballed into a bigger issue for me. There are a number of approaches for doing this. For most sites, they want to have an integrated search mechanism, as this seems the most professional. Static sites make this easier, and libraries like [Pagefind](https://pagefind.app/) can be used to index and search your site, and is a popular addition to Hugo.

However, I had another idea. Do you know what web service can already scan your website, pull out all of the sites, and provide an easy search for it? That's right, it's Google! I got this idea from an old C++ reference site, which used Google as their integrated search mechanism. So, with my bright idea, I decided to try and find the right URL format to execute a request to only search my site. This was when I discovered, to my horror, my website was not present. 

In my basic web-dev classes, we had never covered this. Surely if my website was up, Google would just magically find it, scan it completely and add it to it's search right?

# Adding a site to Google
As it turns out, Google is not omnipotent (yet), so you have to do some leg work for them. Thankfully, this is a very common thing to do, and Google makes the process mostly painless. Firstly, you need to submit it through Google Search Console. This is Google's site for submitting your site to their search engine. You can add both domains and URL prefixes to their search. In order to prove that you own it, they'll give you a file to upload to validate your ownership. At that point you can manage it through the console.

## Robots.txt
In order to prepare for Google to crawl the site, it's best to first add a `robots.txt`. This is a standard to designate how web-crawlers can interact with your site. You place it at the origin of your site, and web-crawlers will automatically check it and (hopefully) follow it. This is most useful for big site that may have significant data. A web-crawler may act like a regular user, but simply using significantly more data than any human interacting with the site. Big webpages will usually offer an API to integrate with their backend if you want to scrape, which can be specified in a robots.txt. In this way, large sites can optimize traffic to dedicated API servers, as opposed to running everything through the main webpage servers, which improves user experience. 

## Sitemap.xml
How do web-crawlers such as Google's know what is available on a site? Again, it's not magic. Most web-pages simply tell you what content is available. This is called Sitemap.xml, which is most often also available at the root of the webpage. These list either each URL on the site, or contain links to other sitemaps that contain the lists. Together, a scraper can stitch these together to find what content is available. Thankfully, Hugo already generates this for me, which means I didn't need to do anything. I did however, have to submit my specific Sitemap link to Google through the Search Console so that Google can fetch it and index the site.

# Where I am at now
Following the above steps, I've added my site to Google. If you search the URL, it will appear. Unfortunately, Google is a little slower than me, and doesn't work at my pace. Even though I've submitted my Sitemap to Google a while ago, they haven't taken the chance to actually scan it and add it. That means my plans for adding a search tool to my site are slightly delayed. I'll probably end up integrating Pagefind anyway at some point, but being able to add my site to search engines was worth all the hassle.
