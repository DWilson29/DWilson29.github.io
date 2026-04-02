+++
title = 'ConWerter: How did a month of effort turn out?'
date = 2026-04-01T18:49:26-07:00
draft = false
+++

My last post was about a small project I was starting work on, and after a month of work I have a final(ish) product! Let me go over how it turned out.

# A Language change, and a turn to familiar territory

When I posted last time, I was very set on using Golang for the project. But, I ran into one big issue with it, and decided to switch. What was the problem? Golang has no good UI library, as far as I can tell. It has libraries supporting GTK and QT, but they're significantly out of date. I particularly disliked GTK, as the install process was very unintuitive. I messed with it, the equivalent QT binding library, and several other libraries for application UI in Golang. I could hardly find one with updates within the last 6 months. 

So what did I do? Well, I happened to know that C# has *excellent* UI support through a variety of toolings. I could use MAUI, WinForms, WPF or even Blazor. However, I was against any kind of web-based solution, as I have consistently heard they are often slower than native, due to having to run inside a whole browser. Which narrowed down the field significantly, until I found my answer.

# Avalonia - Significant progress with some headaches

Overall, my experience with Avalonia was quite positive. Once I switched to C#, I decided to switch to .NET 10 and VS 2025 for development. I found both to be quite painfree, even though Avalonia doesn't officially support .NET 10 as I understand. My only issue was with the Microsoft MVVM toolkit. This utility generates the code bindings for the AXAML files, but I had some trouble getting it setup. This appeared to be due to using the wrong project template from Avalonia. Only one actually properly supports MVVM fully, the other I could not even build the default project.

MVVM stands for Model-View-View-Model. The View corresponds to the visual appearance, View-Model the binding from visual to the backend, and the Model the backend objects. As far as the View, it actually worked out to be quite simple. A simple two tab layout, one tab contents allowing the conversion from text to CW, the other CW to text. The ViewModel was slightly more complex, with two primary bindings, one for each conversion, and several helper functions. The Model side actually had no data, only a simple Converter class to parse and a Player class to handle the beep itself.

I dealt with a rather difficult bug where the playback would hang the UI. This is due to how Avalonia handles threads. Essentially, the UI is handled on one thread, including button presses. This means that we need to use a separate Task to  actually handle playback. 

# Playing audio - A headache when trying to make it cross-platform

Another issue I had was with getting audio to play cross-platform. Now, within Windows there's a simple `Console.Beep` function that can make a beep of a specified length and frequency. However, that doesn't work on Mac or Linux. Since my laptop is a Mac, I had a good reason and opportunity to fix that. 

My solution was OwnAudio, a crossplatform library to play audio in C#. It was quite simple once I got a hang of it. Audio files are handled as sources, which need information around sample rate, channels and volume. Then simply play run `.Play()` and it will start up. I did not figure out how to "reset" the player, which was unfortunate.

# Next steps

In my original post, I had big plans for a potential AI/ML powered analysis of audio to convert it from CW to text. I'd still like to do that, but I'm a little exhausted with the project for now. I might come back and try to get something together.

As far as other stuff, there's some nitpicks, like a settings menu to chose theme color, or adding pro-sign characters (essentially meta-information about the message). One big one I would like to do is setup an automatic deployment system, but I just didn't have the time for it this month.

If you want to checkout the project, you can find it [here](https://github.com/DWilson29/ConWerter/)
