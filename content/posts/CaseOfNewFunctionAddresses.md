+++
title = 'The Case of the Dynamically Created Duplicate Identical Functions'
date = 2026-07-01T06:32:07-07:00
draft = false
+++

I recently had to deal with a case that I thought would make a good write up. While on the surface it seems like an easy problem, it demonstrates the unique differences between languages and implementing the same code across executables. 

# Background
The problem was relatively simple. I had a system that I needed to provide a callback function to, but in order to simulate cases with multiple callback functions, I needed to be able to copy that function such that each duplicate of the function has a different address. When I started, I thought it would be simple. Can't you just create a new reference to the function you want?

# Complications
The code was in C++. While other languages like C# and Python have an easier time handling this with delegate functions, C++ does not handle it very well. This is frankly because it's not built for this. The problem involves how methods are stored in C++.

When you compile a C++ program, methods end up in assembly at a particular address. When you call that method, you pass in the parameters to specific registers and then jump to that method address.

In normal C++, there's no way to create a new reference to that method dynamically. Because it's in the precompiled code, you can't really change that. So how do I do what I need to do.

# What to do?
So, I need to create dynamic references to this same function. There's a variety of solutions for this. You could use a JIT compiler to create a new function in memory, then reference that. I didn't want to add dependencies. Additionally, I only cared about this on x64 systems, which enabled my ultimate solution.

C++ supports allocating new memory, although it's dependent on the OS you're using. By default, memory you allocate is not executable, as that's a security issue potentially, however you can change that afterwards. 

My idea was to write small code in assembly that passes in my parameters, then makes a reference to my "real" function. Then, when I need to generate a callback, I can simply call a handler function that allocates the memory, slots in my assembly code, and then pass the address of that assembly code as the callback. 

# The pattern and the path to it
As I understand, this pattern is called a "trampoline handler". I was unfamiliar with this concept, as it's rather a rare situation. It's a bit of a vague term, but you can see it referenced [here](https://en.wikipedia.org/wiki/Trampoline_(computing)).

How did I learn about this rare technique? My Google-Fu is top-notch, and yet I had a lot of difficulty piecing it together. The final piece? Came from AI. Specifically Claude through Copilot. But, this wasn't a simple "Please fix and make no errors" prompt, I had to gain the knowledge to be able to even formulate the proper question. 

I had half a solution together by myself, but Claude was able to help me put it together. Of course, in the process of passing in the parameters for the trampoline, it mixed up the register for the parameter, taking me a couple minutes to sort out the proper registers for x64. 

I haven't fully sorted out my theories on LLMs, but for this particular use case, using it as a fancy Google, I think is quiet a strong use case. You can't give it free reign, as it will make mistakes. But if you can formulate a proper question, it can piece it together and give you something close, which does speed up the process of making solutions.
