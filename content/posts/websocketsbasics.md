+++
title = 'How I stumbled my way into learning Websockets'
date = 2024-09-07T19:23:59-07:00
draft = false
+++
So I've been on a Golang kick recently. After hearing all the cool kids talk about it, I've been trying to learn everything about it. Along with that, I've been trying to learn new/interesting concepts that Golang can be used for, particularly focusing on stuff I suck at. 

Web development is one such area. I hate Javascript. It gives me the ick-ies. But, I hear of these wonderful Golang packages that let us do so much without having to touch a line of stinking JS. That was not true unfrotunately.

Anyway, I've been focused on learning about making API's through Gin. We have a couple legacy API's at work, so I've been thinking about how would I (if I were a Founding Principal Senior 10X Developer/Engineer Important Person, which I am not) replace them. 

Gin is a quick framework for making API's. You plug in your routes, tie it to whatever backend you have, and boop bop skibidy dop, you have an API. Yes, it really is that quick. 

However, as you may have quessed, this isn't about Gin and API's. 

I got myself into a scuffle with Websockets.

# The problem

I get to thinking about modern websites, and how there's so much interaction between the server and the client. I got to thinking - "How do they program those interactive counters on websites that tell you you'll only have 10 minutes to buy an item or whatever?" Obviously, there has to be some message sent from the server to the client, but what does that look like?

# My first solution - a failure

So, I think "Hey, I know this fancy dandy Gin, that can totally do this" No it cannot. HTTP cannot send live updates to a client. The server doesn't really even know the client exists, just that someone from there had asked for a path. Yes, I really was that stupid. But the stupid person who admits they're stupid is probably getting smarter than another idoit who never admits that.

# Attack of the Gorilla

So I get to googling and binging and duckduckgoing. How the hell do they actually do this. And I remember watching a Primeagen video about Websockets a while ago. So I started looking for a way to do websockets in Golang.

And thats when I discovered Gorilla.

## What is Gorilla
It's websockets in Golang. 

## What's a websocket
It's a way for servers and clients to shout at each other. On supported browsers, after doing a HTTP Get request to get a webpage, a client can request a websocket connection with the server. Once they're connected, it's on.

![The Handshake From Predator](/predatorhandshake.jpg)

Once this connection is made, you can send whatever you want from either side. 

Of course I had to write some Javascript, but it wasn't too bad thankfully.

# The Example Implementation

So, how does one go about making a counter from the server without knowing anything about Gorilla or websockets?

Slowly.

I started by analyzing a template from Gorilla, their "chat" example. This allows users to send and receive messages on a log. It's pretty cool by itself. 

This example structures around four files.
1. main.go
2. hub.go
3. client.go
4. home.html

## Main.go

Main.go uses the default `net\http` framework from Golang to serve two paths, a main `\` path, and a `\ws` path. The `\` path serves the home.html page, while the `\ws` sets up the websocket connection.

## Hub.go

The hub is how it manages dropping and adding clients. Since in this example messages need to be carried from client to server to all clients, we need to manage the shared connection. Pretty nifty.

## Client.go

What does each individual client do? How do they get and send messages? All of the fancy stuff, and the most adjustable depending on the project.

## Home.html

The webpage setups the JS interaction for the page, and makes the websocket connection possible.

# The Actual Counter Implementation

So how do we take that and make it do what I what it to? A few small steps need to happen.

1. Update the HTML page to only receive, and have one element to update. No need for the sending command since clients won't send.
2. Remove the client interaction functions from `client.go` and add a loop to send messages every second to the client.

And bippity boppity we have our counter! Course this version sucks. We could cut out the `hub.go` interaction since there's no interaction between clients. Or I could add it so there is interaction. Generally you would not just do one thing at once. Highspeed 10x devs do a million bazillion things at once.

I'm kinda tired from this and everything else I'm gonna wrap it here. But, I'll update or make a new post for when I update this implementation with Gin. I like Gin. I also want to try and make a Sqlite database backend with a Gin frontend. That sounds super coolsies.

Nighty night