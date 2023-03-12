# My (probably bad) Opinions

## Documentation
Documentation should be SCM controlled almost always. 
If the documentation has anything to do with a program, then it usually should
be controlled in the same repository, and usually in the same source code file
that it pertains to when possible.

ReStructuredText -> Mardown -> everything_else

## Diagrams
Try to make diagrams in code if you can.
Dynamically if you can,
or with a tool that generates the diagram code for you.

plantuml -> diagrams.net -> everything_else

## Shell scripting
I fell to the trap of using bash too heavily and for things that were far more
complicated than a scripting language like bash was ever meant to handle.

Another big pitfall of using bash has been one of compatibility.
Basically if I have to think extra hard or limit certain enviornments because
of the scripting language that I choose, than I would have simply been better
off choosing something else.

Since shell scripting should really only be used for small and relatively uncomplex
cases, there is usually little reason to use any of the 'advanced' features that
are possible. And don't get started on all of your other favorite scripting tools,
if you want something that is over engineered for it's purpose, and will likely require
specific additional steps to get things working depending on the environment, 
then you are making your whole process more complex with little benefit, and the 
benefit that you gain by using these shells are complete trash compared to basically
every other modern language out there. And the other languages are also more likely
to be more ubiquitous anyways.

So with that, just use `sh`, and if that isn't cutting it then switch to a language
that is better than the task that you are trying to accomplish. Since you shouldn't
be writing scripts longer than a couple hundred lines anyways, by the time you realize
that you should be using another language, there shouldn't really be that much code
to port anyways and you will likely find that finishing your script will go faster
anyways.

## Operating Systems

So, with operating systems, I think as long as you can run containers, you are good.

Which is to say, you shouldn't use your operating system for anything important,
especially not for building or working with code!

Of course the exceptions are the scripts and tooling that are required to go from your
operating system to an environmeny that you are interacting with containers. And
this tooling should be minimized as much as possible.

What should you use for your local development environment? containers.
What should you use for your build system? containers.
What should you use for your deployment? containers (when possible), otherwise use what you need to.
What should you use for your tools? containers (whenever possible).

You are probablly getting the idea now, and before you start talking about all of
the downsides of using containers, yes, many of them are legit. However, I think
the upside heavilly outweighs the downside. Consistency, reliability, and Control.

## IDEs

I prefer having one consistent way to do things. The choice is usually highly influenced
by how likely I think that tool is to maintain the highest level of community support in
the form of documentation, plugins, future promise of maintainend support.

In the present time, I prefer VSCode, even when there are better IDEs for a specific task,
the upside of using a single IDE for all your code is an enormous one that should not be
overlooked.

Do you want to become a mediocre user of 3 different IDEs or do you want to be a boss at
an IDE that works in every language that you use. Worse, do you want to become great at
a single IDE and then either try to cram every other language into that IDE because
"it's the one I know" or alternately have to learn a brand new IDE that you will probably
be really inefficient at for a long time and now have to learn multiple tools well
and switch back and forth, or switch over completly.

## Build systems

I don't really know enough about this to make any type of informed decision, but in
line with the philosophy that it is better to use a single tool that can work with everything
than a bunch of separate tools that are individually better at specific tasks.

It seems like Bazel 'might' be this, but I'm not sure. This one is also a bit tricky, because
a lot of build tools can sort of do this thing, and the best one is probablly the one that
is going to be the best in the future. So this comes down to guessing which build tool
(probably one that doesn't exist yet) will be the front runner in 10 years.

Also, the tool should only need to be installed in a container.

