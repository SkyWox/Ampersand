# Ampersonate

* [What is it](#what-is-it)
* [What has been added](#what-has-been-added)
* [What is "Slow Mode"](#what-is-slow-mode)
* [What needs to be added](#what-needs-to-be-added)
* [How I made this](#how-i-made-this)

## What is it?

This is a recreation of Ampersand's iOS app channel screen in [Flutter](https://flutter.io).
Flutter allows for quick platform-agnostic development. Android and iOS apps can be built from the same source code.

**[Try it on Appetize](https://appetize.io/app/2afcujrh0215k2rqq787b1r2e4?device=iphone6s&scale=75&orientation=portrait&osVersion=11.1)**

![Resulting App](./Result.gif)

## What is "Slow Mode"?

Appetize can't run ARM code, so the app needs to be build in a debug profile. Debug has significant overhead (for hot reloading and checks) so the framerate is lower.
One of Flutter's selling points is its fast renders. To see it, just build a release version by running `flutter build [ios/android]` at the project root.

## What features have been implemented

* Stack to overlay the Profile with gradient over the Author's picture
* Functional components allowing infinite writing samples to be added
* Component-based structure allowing new features to be swapped in easily.

## What needs to be added

* Import of Bundle information from JSON so we don't have to look at just Mr. Pearson's charming face!  
  -- Currently details are hard-coded into the app since there is only one author  
  -- Flutter has its own method of importing JSON that I didn't implement for this MVP
* Add navigation to other pages in the app
* Use custom fonts and match your exact shade of purple

## How I made this

Prior to making this app I had no experience with Flutter or any iOS app development. This app was made in less than a day, including setting up the Flutter development environment on my computer. A rough breakdown of the hours spent:

**Hour 0-1**: Setting up the Flutter dev environment and familiarizing myself with the Flutter docs  
**Hour 1-2**: Building the stack for the profile photo and information  
**Hours 2-5**: Implementing the scrolling view, the sticky header, and individual components  
**Hours 5-6**: Creating documentation, building app packages, uploading to Appetize, etc.
