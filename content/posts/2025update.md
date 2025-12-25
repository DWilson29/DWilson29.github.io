+++
title = '2025 Update: What is going on?'
date = 2025-12-24T21:08:00-08:00
draft = false
+++

So, it's been over a year with nothing happening here. What's going on with me?

## My current job
On my last update, I was only 3 months into my current job. Over the past year and a half, I've grown a lot technically and professionally. I've been exposed to a lot of technologies. 
- GRPC
  - We've had a lot of interesting work this year with GRPC. I've had to greatly expand some of the existing services. I've had to dig into improving stability through deadline/cancellation tokens, which have been very interesting to learn about.
  - We also had a very interesting problem. Some of our new hires had an issues getting the existing infrastructure working locally. I was helping both of them setup everything else, so when they encountered it I was naturally the first person to investigate. I tried everything, from improving authentication, messing with firewall settings, including Wireshark traces to determine what was going on under the hood. I eventually determined that the issue was with their development system setup, which turned out to be a new security policy from IT blocking all incoming connections! With no way to disable it :(
  - Several months later, and with everyone getting a forced dev-box upgrade meaning they too would be affected by this issue, and we were able to address it.
- WinApi
  - I've had to expand my knowledge of the Windows API, specifically around strange edge cases for process launching. We had a couple that really messed us up this year, but after digging into the docs we gained a lot of clarity. In particular, the main issue we had was with the particular `STILL_RUNNING` 259 status code. This signals the process is still up, but unfortunately `pnputil.exe`, the primary executable for installing drivers in Windows, happens to return `ERROR_NO_MORE_ITEMS` in some cases, which is also a 259 status code! Microsoft specifically warns to NOT use the `259` error code for processes, so why they used it confounds me. 
- Selenium
  - I've learned a lot about Selenium this year. We've had to expand some of our testing to cover webpages. One issue we had was with stability. The webpage we were testing was constantly changing, which unless handled gracefully, would cause intermittent failures. Adding a simple retry fixes this issue, but determining the cause was difficult. Thankfully, the Selenium docs are extensive!
- Python
  - To quote Bilbo Baggins `I don't know half of you half as well as I should like; and I like less than half of you half as well as you deserve.` This applies to Python, as I really hate it. Unfortunately, we had a internal SDK only available in Python, and I got assigned the task of making a simple service to interact with it. I find debugging is the biggest issue in Python, although I have since learned you can download the PDB's easily. But between that and the lack of any compilation, it's easy to make stupid mistakes. I said I'd get it done within a week, and low and behold, it took a week. Thankfully, we've had no issue with the actual client, but we've had some issues setting it up as the client was originally setup with an older version of the hardware, which we then had to upgrade. 
  - This upgraded hardware had a different Python environment setup, which really messed me up. Python services, setup with `pythonservice.exe`, do NOT support virtual environments. This is a serious issue, as the new hardware had the internal SDK package within a virtual environment. My stupid solution for a stupid problem? Move the SDK to the python installation directory, making it available for the system account to see. As far as I can tell, this is the only way to get around this Python virtual environment issue for the System account. 

It has been a bit of a rough year. Lot's of internal shakeup, both within my contracting company and the primary company. I hope next year is much more peaceful.

## Previous projects
### Udemy course on ASP.NET and Angular
- I find myself very weak on the web development side. I set out to learn some more about modern web development earlier this year. I was intrigued by Angular, as I had little experience with it, and it was different enough to React which I had learned in high school and college. 
- ASP.Net was very intriguing to learn, but since it built on my existing .Net background, I felt very comfortable.
- Angular was much more interesting. I learned about CORS, which sucked but I suppose it's for a good cause. I think Typescript is a little silly, but only because it's really Javascript. Learning about user authentication with JWT and cookies was cool. 
- While I was working with Selenium, I decided to setup a small project to test my website. That was fun!
- I got most of the way through the course, but I've lost steam with it. It hasn't been as helpful in my current role, and my interests are drawing me elsewhere.

## Upcoming projects
### FPV drone!
I've got all of the parts together to create a simple FPV drone, and I've been working on getting it together. It's been a good project to work on my soldering, but I've been very slow at it. My iron is a little weak, so I for the final battery wires, I'm having trouble getting enough heat to properly adhere the thick battery wire. I might have to get a friend to help me.
Although, I recently picked up LiftOff, which has been very fun to learn. I crash a lot still, so good I'm crashing my virtual drones!

### Godot Simulation Game
I've committed myself this year to building a game in Godot. I've had such an interest in simulation games, ever since I played all of the classic Paradox games (Victoria 2 being my favorite). I want to create something *inspired* by those. I hope to share more details soon :)

### HomeLab
I've setup a bit of a HomeLab in my small apartment. So far it's a single Raspberry Pi hosting a few docker containers. I'm in a bit of a weird situation, as my entire network is connected through a 5G modem, which of course has poor configuration policies. I've taken to setting up a secondary router, then using Tailscale to get into the network from outside. I want to get as much stuff off the cloud as possible, and I hope to complete that this year.
