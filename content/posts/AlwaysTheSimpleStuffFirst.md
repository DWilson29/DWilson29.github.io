+++
title = 'Always Check The Simple Stuff First: A Short Anecdote'
date = 2026-08-01T08:05:03-07:00
draft = false
+++

I usually am fairly technical on this page, but I have a friend's wedding to go to today, so I figured I'd share a hopefully amusing anecdote.

# The Setup
You're coming back to your car after a grocery run. It's a warm early fall night, the sky still faintly glowing. You unload the groceries into the car, hop in and turn the key. The dash briefly lights up before you start the ignition. Then, everything turns off. You try again, nothing. Panicked, you check to see if your headlights are on, they aren't, but they won't turn on. Thinking a fuse must've blown, you pop the hood and open the fuse case, carefully pulling out each of the fuses, your dread growing as you see each fuse was fine. You realize there's a second set of fuses in the driver side footwell, so you bend backwards and wedge your way in to see the fusebox, again your inspect each fuse, but all of them are fine.

You work your way out of that awkward position and try again, still nothing. Could your battery have died? Could your starter motor be dead? What if an EMP went off and it only affected your car? The possibilities were endless, all the while your brand new ice cream slowly melts in the grocery bag.

# The Background
This story really happened to me last year. My daily driver is nearly 40 years old, and has always needed special car. Most modern cars just need an oil change and the occasional lube, but older cars need more support. I've had to repaint it all, replace brake pads and calipers, replace the starter 3 times, replace all of the hydraulic cylinders, and replace the head gasket. Additionally, I'd had some issues with my electrical system, which was due to faulty factory wiring of a relay. I was able to rewire it and replace it with a standard relay correctly wired.

I felt like I had a pretty good grasp on keeping up with the old boy. In my mind, suddenly having the electronics die when the ignition is turned meant a fuse blown. The fact that none of them were blown confounded me. Surely that was the most likely case. What else could it be? 

# When in doubt, phone a friend
My father always helped me work on my car. When I got it in high school, he helped me restore it and got it working great. So, confused as I was and with little time, I called my dad to see what he thought. I explained everything I'd gone through, and he asked a stupid question. "Have you checked the battery terminal?" Obviously this was stupid, as it's not like they just loosen themselves right?

I pop the hood back open and check the terminals. The positive end was rock solid. I jiggle the other, and it moves. It's completely loose. As soon as I jiggle it, the headlights turn on. It really was that stupid.

I got a wrench and retightened the terminal, and it fired up like normal.

# The moral of the story
When evaluating why things don't work, we can work through the solution in a number of ways. Sometimes it's best to check that the most critical parts are still functional. For example, if you have a cloud service that suddenly stops working, it's reasonable to check if AWS/Azure/GCP have an outage first, since if they're down, there's basically nothing you can do unless you have other regions already configured. At other times, you need to start with the easiest thing to check first. In this case, based on my understanding, checking the fuses was the easiest thing to check. 

It's hard to properly evaluate problems when we're under pressure to complete them quickly. Doubly so when you have no one to bounce ideas off of or to make suggestions. A grocery store parking lot is not the best place to solve a car problem, but sometimes it's what you have to do. If I had everything I needed, I could've checked the voltage on the battery and tell it was still good. I could've checked voltage at any of the other points and seen that nothing was live. Fundamentally though, I had not thought that my terminal connections could be loose, and thus I hadn't checked. 

I hope this story serves as a good reminder to not forget the stupid stuff, and to always check your assumptions at the door.
