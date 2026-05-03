+++
title = 'Coding on a MacBook: The Pros and Cons as a .NET developer'
date = 2026-05-01T22:16:17-07:00
draft = false
+++

My primary laptop is a Mac, specifically a MacBook Pro made around 2015. I've had it for 4 or 5 years at this point. It has served me reasonably well, although I've had a number of gripes. I've always used Windows, or occasionally Linux. This is my only experience with the Apple ecosystem, so getting used to it has been a bit of a struggle.

# The Positives of using a Mac

I have found a few things that Mac does better than Windows or most Linux distros, at least at the time. I had heard a lot about how intuitive the Mac layout is, simply flick you fingers to the side and a whole new desktop appears. You can treat one monitor like 1 or 2 or 10 separate monitors, each with their own environment. While this might not be as useful in a desktop environment, where you often have 2 monitors anyway, in a laptop this is quite novel. Modern day GNOME was able to take the core elements of the Mac layout and improve them by my understanding, but you do have to give them credit for coming up with the idea. 

I have also found that Homebrew is quite good, at least when compared to Windows. I have found the built in Programs manager in Windows to be next to useless, especially for older software. Winget and Chocolatey are okay for managing some software, but I've found the installation process to be a little weird, particularly when trying to automate it. By comparison, pretty much anything you want is on Homebrew or Cask, and it's simple. However, even then Homebrew is not without it's own difficulties. Specifically, it mainly supports the latest MacOS version. This means that it will not keep older package versions for older platforms. For example, I was attempting to download a package, but it required XCode. The problem being that XCode doesn't install on my Mac version, as it's too new. Macports has been quite adequate in handling my needs. 

# The Negatives of using a Mac

My first gripe with the Mac ecosystem is the hardware. It's well-made, and cleans well. If you are familiar with the model, you'll know it has the fun light up Apple on the back of the screen, which is admittedly cool. But I have being stuck to this hardware. Hardware degrades, gets damaged, and worse. Apparently this model can also overheat the battery and catch fire (although mine is unaffected as I understand). Servicing the Mac is a pain. I think I need to replace the battery, as it randomly seems to die and lose a major percentage of the battery when unplugged. To replace it, is a 70 step process involving removing half the components. I am not looking forward to the process.

I don't like that Apple doesn't support OS updates for the system. Why can't the core OS simply be updated to the latest, while newer features tied to hardware just don't work. It's almost as bad as Windows 11 requiring the TPM 2.0 Module, which has caused me endless headaches at work. Now, you can get around this with OpenCore Legacy Patcher, which can flash newer OS versions onto old hardware. But, it seems a bit risky and could mess up the system worse.

But the worst aspect for me is the experience of coding on the Mac. Physically, it's actually okay. The keyboard is quite comfortable for my hands, but because I'm primarily a .NET developer, I have some issues.

# Coding .NET on MacBook

For me, coding on Mac for .NET is a pain. On Windows, I am quite used to the Visual Studio environment. Yes, it kind of sucks, and it's slow. But, for working with Visual Studio projects, it is the best. Despite all of the slop, it is quite adequate for dealing with large projects, especially in a enterprise environment.

Now, Visual Studio doesn't run on Mac or Linux. In 2018 Microsoft denied the request to support Linux, and Mac support was killed in 2024. As a casual developer, I can often simply only work on my main Windows workstation instead, so it isn't a problem. Recently, with this ConWerter project, and a new project I'm working on, it would be really nice to work on my code elsewhere. Normally, I use Nvim for simple code and Visual Studio for .NET code. So, my first idea was to simply try and make Nvim work for C#.

Theoretically, you could code .NET on anything that can modify text. But, being used to the comforts of Visual Studio, I was mainly interested in the auto-completion features. In the background, this takes the form of a Language Server Protocol (LSP). This processes the code and searches for any issues. For .NET, this is called Roslyn. Of course, you can decouple the Roslyn server from Visual Studio. This involves running it individually, then having some Nvim plugin to tie into it. There's two big ones, OmniSharp and Roslyn.nvim.

I had difficulties with OmniSharp, but Roslyn.nvim seems a little better. For small projects, I have installed Visual Studio Code, but to me it's even more of a pain. It somehow seems slower than regular Visual Studio, and while I appreciate it's cross-platform nature the plugin ecosystem doesn't vibe with me as well. 

# What should I do?

I'm not sure what I'll end up doing. I could keep my existing MacBook, which has been perfectly adequate hardware wise. I could upgrade to the latest Mac, either the Pro, Air or even the new Neo. I could also go out and buy an older refurbished enterprise laptop, likely a Thinkpad, and put Linux on it and move on with my life from this. I love the idea of Linux. I think I'm just scared of commitment to it.
