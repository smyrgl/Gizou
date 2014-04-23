# Gizou

[![Build Status](https://travis-ci.org/smyrgl/Gizou.svg?branch=master)](https://travis-ci.org/smyrgl/Gizou)
[![Version](http://cocoapod-badges.herokuapp.com/v/Gizou/badge.png)](http://cocoadocs.org/docsets/Gizou)
[![Platform](http://cocoapod-badges.herokuapp.com/p/Gizou/badge.png)](http://cocoadocs.org/docsets/Gizou)

## Introduction

### What is it?

What is Gizou?  Put simply it's a factory for Objective-C developers for creating sample data very similar to the projects which inspired it such as [MBFaker](https://github.com/bananita/MBFaker) and [Faker](https://github.com/stympy/faker).  If you've ever had to create sample data before you know it can be tough to get right (you DON'T want to just use randomly character strings for everything if you want to avoid heartache) so the best solution is a library that can generate realistic data such as names, emails, addresses, etc.

### OK, so why use Gizou instead of some other library?

I created Gizou because after using [MBFaker](https://github.com/bananita/MBFaker) quite a bit when creating [Foundry](https://github.com/smyrgl/Foundry) (another project of mine which is a factory for objects that I totally suggest you also check out) I realized it was lacking in a few keys places.  Gizou improves upon and addresses these issues by adding the following features:

- **Sequences**: When you are using sample data to create properties that need to be unique it is important to be able to ensure uniqueness otherwise you will get weirdly failing test cases that are almost impossible to track down.  I have run into this issue a number of times and it is extremely vexing, so Gizou includes the ability to create unique collections of key properties.
- **OSX and iOS Compatibility**: If you write libraries or apps that are meant to be used across both platforms then you are used to writing tests for both so you need a test data generator to work for both.
- **Test images**: I can't remember how often I've needed sample images.  Gizou provides the ability to simulate both static color images that are procedurally generated to a specified size but it can also fetch random images of a given size from the internet which gives it a nice utility when you are trying to stub out image data.
- **Nearby Locations**: How often have you wanted to get locations within a specified distance of a given point?  Well now you can.  Gizou will return random locations within a specified radius of the target location...how cool is that?
- **Doesn't require a YAML parser**: The source data is in JSON so it doesn't have a depedency on a YAML parsing library.
- **Convenience Categories**: The API has generally been crafted to be a little more friendly than MBFaker and includes things like convenience categories and stripping of some unecessary compexity.  However the API was designed so I could do a drop-in replacement pretty easily so you'll notice some interface similarities.  
- **Fully documented with lots of tests**: You may or may not care about this but it is certainly nice to have.

Enough reasons for you?  Go ahead and try it out and if you want full mock objects (both NSObject and Core Data NSManagedObjects) that is built on Gizou also check out [Foundry](https://github.com/smyrgl/Foundry), especially if you want something like [factory_girl](https://github.com/thoughtbot/factory_girl) but for Objective-C.

## Installation

Gizou is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "Gizou"

## Author

John Tumminaro, john@tinylittlegears.com

## License

Gizou is available under the MIT license. See the LICENSE file for more info.

