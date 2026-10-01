+++
title = 'Home Assistant: The Final Frontier of Smart Homes?'
date = 2026-10-01T07:33:10-07:00
draft = false
+++

I've been living with a smart home for a while. In 2016, my parents setup a SmartThings hub, which allowed for all of the usual Smart Home comforts. Automated lighting, entry detection, even water leak alerts. Back then, smart homes were still fairly new as a concept. My main role back then was keeping all of the sensors from dying and installing new sensors as needed.

My parents recently moved to the beach for their retirement, and as such have expected all of their usual smart home comforts. However, after nearly 10 years of living with SmartThings, they've grown quite weary of it. The primary concern is that Samsung purchased the company, which started making a lot of changes. For one, they got out of the hardware game, so you have to purchase a third party hub to run their software. We've found that the app itself doesn't work great, and relies on their cloud services.

If I don't like there ecosystem...

# Is there an open source solution?
Yes! It wasn't as popular in 2016, but Home Assistant has become the definitive smart home solution for many. They make it relatively simple. For a new user, you buy a hub from them, plug it in and do some light setup, and it just works. You can connect to it from a mobile app or from a webpage.

I recommended it to them over trying SmartThings again. And so far, we have just fallen in love with it. The three most important parts of Home Assistant that I find useful is integrations, customization and automations.

## Integrations
In SmartThings, the data you have is primarily tied with your direct devices, or their cloud services providing information like weather and such. Home Assistant has both, but also allows for community made extensions, called Integrations. These attach in your hub as sensors, which can then be analyzed or can trigger scripting. For them, the three most useful integrations for them have been a tide tracker, which allows them to see when low and high tide is at the beach, a ping tool that allows you to check the connection status of important servers automatically, and a speedtest integration. 

## Customization
We have absolutely loved how customizable the display is. There are all kinds of theming and display options. The most important part though is sorting information. I could make a simple dashboard for them that displays all of their important information and allows them to turn on lights immediately.

## Automations
I think the highest value item though is automations. Home Assistant allows you to very easily create automations to control your house. For example, it's really nice to have a light on outside before it's dark. SmartThings allows this, but Home Assistant takes it to a new level. You have the option of 3 different twilights to consider, civil, nautical, and astronomical. Before, it felt like you just got close, but with Home Assistant, you can trigger outdoor lights at civil twilight, which happens as soon as the sun sets. A simple offset to trigger slightly earlier also helps to make it more useful.

You can also tie devices together. For example, you may want to turn on all of your house lights when you get home, especially in common areas. I could tie all of their lights to one button on their home page, so they just open the app, click the button, and have everything bright. It's delightful.

# The deep magic: everything is plug and play
The best part of Home Assistant is that sensors are easily integrated through ZigBee. It makes it easy to find sensors (which also makes it the perfect birthday gift), and you can get nearly everything you could want. For anything that isn't sold, you can build it yourself and integrate it. Zigbee is the most common, but these days Thread is the new hotness. 

Through the integration system, you can do nearly anything through the Home Assistant device. Integration with NVRs or IP cameras, even running media servers of the device. If you already have a server, you can just run Home Assistant on that. 

I have some more to look into, for instance I'd love to get voice integration working on it, which seems to be quite easy to add! My parents are in love with Amazon Alexa, as it easily integrated into SmartThings previously. Now, the only way to get Alexa to work with Home Assistant is to use Nabu Casa, which requires a subscription. I am still of the mindset that putting listening devices in your home isn't the most secure idea, but if it's only local that's marginally better to me.
