+++
title = 'ConWerter: My new little project for CW conversion'
date = 2026-03-01T20:55:43-08:00
draft = false
+++

I've been looking for a new project to work on. While I've been recovering from my illness (which I think thankfully is over!), I did a little project just to keep my fingers sharp. I think I'd like to expand on it to be more fully featured.

# Why?
In radio communication, CW,  Morse code, is generally the most effective form of communication, particularly over long distances. This is not so much due to the throughput, as it takes significantly longer to properly enter the morse code that makes up a phrase, but rather due to efficiency. Voice communication, usually through FM with narrow/wide band, AM, or traditional FM radio, takes up significant band width. For instance, traditional FM takes up either 12.5 or 25kHz. Think back to Calculus for a moment, and take that transmission power (Watts), essentially get spread across the whole range of the transmission. Therefore, a wide transmission has a smaller signal strength, and conversely, a thinner transmission has a comparatively stronger signal strength.

What that means is that for the same input power, you can get greater signal strength from CW then essentially any other modulation. What's the problem with CW? For Gen-Z IPad kids, learning it can be a struggle!

# What is it?
My little project, which I've called "ConWerter" (which I though was quite playful), is designed to help this. My original intention was to allow you to input a phrase, and receive a CW output. Ideally, this is intended so that you can automated it or learn common phrases. 

You can view the source code [here](https://github.com/DWilson29/ConWerter).

# Where do I want to go with it?
Right now, my main goals with it are to make it more fully featured. Primarily, this involves

1. Expand the symbol coverage. Currently it only uses International Morse Code, but I'd like to optionally add in American standards and further special characters.
2. Add the ability to convert CW (- and .) to text. You'd still have to enter it as a string, but it should help decode anything you hear.
3. Add a UI! Currently it's just in the terminal, but I'd like to use GoTK3 to make a UI for it. 

Past this, I have a couple long term things that would be really fun to try, but I'm not sure if I'll get to it.

1. Upload a recorded CW message and convert it to text.
2. Take real time audio (CW and voice), and convert it to the other. I think the easiest way would just be to train an ML model.

I'm going to try and get through the first 3 in the next month, probably starting from the bottom up. We'll see how it goes!
