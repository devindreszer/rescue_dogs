# dog fortunes
Tinder for Rescue Dogs

Check out the live app on [Heroku](http://rescue-dogs.herokuapp.com/)

## Features
* Guest users can search for rescue dogs by zip code
* Guest users can flip through rescue dogs and their fortune messages
* Registered users can add a dog as a match and get more information about the dog
* Registered users can track their dog matches
* Registered users can add a dog match to their favorites and view their favorites
* Registered users can have a single top dog

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
