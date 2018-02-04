# C4tK 2018 Project Template

This is a basic rails app setup for C4tK 2018.

If you want to roll your own authentication, check out the [bare-app](https://github.com/mellowfish/c4tk-2018/tree/bare-app) branch. 

## External Tool Choices:

- CSS Framework: Zurb [Foundation 6 Sites](https://foundation.zurb.com/sites)
- HTML Templating: [Slim](http://slim-lang.com/)
- Null Object Builder: [naught](https://github.com/avdi/naught) by Avdi Grimm

## Code Design Decisions:

I have chosen to go with the repository pattern for persistence abstraction. 
This means no direct calls to ActiveRecord anywhere in controller code.

I am also creating functional process objects for non-trivial data manipulations.
These objects have dependencies injected into the initializer, and the only other public method is `#call` which takes all relevant data.

Process objects for single models will probably be hidden behind the relevant repository.
I may create repository facades for non-persisted models or meta view-models as needed just for a more consistent level of abstraction.

> Note: This is mostly an experiment for me as I have always used ActiveRecord, but found it hard to write properly abstracted unit tests for models and processes.
> I *did* try to do all of this with [ROM.rb](http://rom-rb.org/), but I couldn't get a basic setup working in a few hours, so I pivoted to doing it all by hand.

I have also cheerfully embraced human friendly URLs wherever it makes sense.
If at all possible, I will never have a bare `:id` in the URL.
This does not mean I am opposed to resourceful routes where it makes sense, just to opaque garbage in the URL.
