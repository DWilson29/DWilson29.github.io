+++
title = 'Can AI Replace Web Developers? Dynamic Target Scaling Website'
date = 2026-10-30T06:40:34-07:00
draft = true
+++

I've decided to make this a bit of a series. Previously, I looked at data science and see what an AI agent could do to provide results from a laymans input. This time, I wanted to try and see what it could do with a toy example I've had bouncing in the backlog for a while.

# What is the project?
In firearms training, a common practice is "dry-fire", that being practicing the handling and aiming of the firearm without any ammo. This gets the shooter used to the specifics of the grip and trigger. Typically, this is done with paper targets, but because most people do this within a room in their house, the targets need to be scaled to simulate a real distance.

The project itself is simple. It is easy to scale a image on a webpage to a realistic size, based on the distance from the screen and the simulated distance. 

While I'm familiar with the basics of web development, I haven't done much with client side libraries like React since college, so this seemed like the perfect refresher.

![Screenshot of Website](/DryfireWebsite.png)

# How did (A)I do it?
This was largely a "one-shot" style of prompt. I gave Claude the prompt describing the website as I had originally defined it, and added the clarification that I wanted to add new targets over time.

The LLM could plan out it's task in such a way that it came back with several questions, mainly on how I wanted the project to be created. Firstly, I specified that I wanted it to use ReactJS, but creating a project in React has two different ways, Vite and Create React App. Being a layman, I chose the second option without any Googling. This was my first mistake, as later on I had to have it remake the project in Vite, as Create React App is deprecated.

It did rather well at the basic code. I specified that it should break components into folders to better organize it, and that seemed to help. It broke it down into the Calibration, Sidebar and Target Display components. 

# What did I do to finalize it?
There were several features I wanted to add from my original definition.

1. Given a JSON list of target types, allow us to define images and shapes for target types. Additionally, generic shapes (squares, circles) can be made into different colors. 
2. Allow users to input their scaled distance in a variety of formats, for instances I used yards by default, but feet and inches or meters need to be supported.
3. Add a Calibration feature for the display size. We assume a 96ppi for simplicity, but on mobile or tablets usually the display is higher resolution, and thus needs to be adjusted.
4. Styling, mainly to remove the default React icons, I wanted something generic instead.

Each of these the AI handled well, but there were still issues. For example, most browsers allow you to scale the window, and that scaled window should have the element adjusted such that we handle the zooming. This means that as the user scales the window, the target stays the same.

Additionally, when the user transitions between yards, feet and meters, I wanted the distance to stay equivalent roughly. This required adding a feature to convert the units when making the transition.

# Limitations
This is a very toy like example. The webpage is entirely client-side render, with nothing but a server hosting it. There is no authentication, authorization, API calls or anything else that requires multiple devices working together. 

The part I wasn't expecting was how well AI handled the front-end. I assume from all of the scraped web-pages, it's gathered a large enough dataset to know what a "good" looking webpage needs to have. It was generic and not exactly eye-catching, but serviceable is acceptable in this exercise. 

Overall this was a very fun afternoon of messing around, but I don't really feel like I've learned a lot of React from it. I saw all of the code, but and I can understand each part, but because I wasn't really hands on with the code, I still feel unconnected with it. Since I don't plan to maintain this much, it doesn't really matter, but in production that knowledge is crucial.
