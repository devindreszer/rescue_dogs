# RescueDogs
Tinder for Rescue Dogs

## Features
* Guest users can swipe left (click arrow) through rescue dogs "posters" in their area
* Guest users can swipe right (click button) to get more information about a dog
* Registered users can add a dog to their favorites
* Registered users can see all dogs they have swiped right on
* Registered users can share a dog "poster" to twitter or facebook

## Description
This project was created to meet requirements for Project 1 in General Assembly's Web Development Immersive Program (June 2014).

Intended to test our ability to create a functional Rails app.

This project was conceptualized, scoped and developed in one week.

## Installation
This app requires an API key and secret from [petfinder.com](https://www.petfinder.com/developers/api-docs)

To begin:
* Fork and clone
* Create .env file (this is a hash! so we can access things like a hash)
* Add .env to .gitignore file
* Add API key and sectret to .env file as a hash with format
```
PETFINDER_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
PETFINDER_SECRET=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```
* Run ```bundle```
* Run ```rake db:setup```
* Enjoy!

## Contact
Contact the developer on [GitHub](https://github.com/devindreszer/)