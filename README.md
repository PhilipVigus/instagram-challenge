Instagram Challenge
===================

## Instructions

* Challenge time: one weekend
* Feel free to use Google, your notes, books, etc., but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

## Task

Build Instagram: Simple huh!

Your challenge is to build Instagram using Rails. You'll need **users** who can post **pictures**, write **comments** on pictures and **like** a picture. Style it like Instagram's website (or more awesome).

Bonus if you can add filters!

## How to start

1. Produce some stories, break them down into tasks, and estimate
2. Fork this repo, clone, etc
3. Initialize a new rails project

Remember to proceed in small steps! Getting confused? Make the steps even smaller.

## Code Quality

For linting, you can use the `.rubocop.yml` in this repository (or your own!).
You'll need these gems:

```ruby
gem "rubocop", "0.79.0", require: false
gem "rubocop-rails"
```

You can also lint Javascript, CSS, and ERB — feel free to research this. These
will help you to train yourself to produce cleaner code — and will often alert
you to mistakes or mishaps!

## User stories

As a Monster
so that I can share my experiences and thoughts with others
I want to post pictures
13

As a Monster
so that I can see what I have posted
I want to see a list of all my pictures
5

As a Monster
so that I can see a picture's details
I want to view a single picture
8

As a Monster
so that I can post pictures as me
I want to sign up for Monstagram
Requirements
- tell me if my monstername or email is taken
- tell me if my password is valid
5

As a Monster
so that only I can post pictures as me
I want to log in to Monstagram
Requirements
- tell me if my password or monstername are incorrect
5  

As a Monster
so that I can avoid others posting pictures as me
I want to log out of Monstagram
Requirements
- redirect to the log-in page after logging out
2

As an Administrator
so that registered monster' accounts are protected
I want to restrict access to the majority of the site to logged on monsters
- redirect to the log-in page if access is attempted
3

As a Monster
so that I can give some context to the pictures I post
I want to give each picture a caption
8

As a Monster
so that I can tell another Monster their picture was good
I want to like a picture
8

As a Monster
so that I can see all of my favourite pictures
I want to see a list of my liked pictures
8

As a Monster
so that I can communicate with other Monsters
I want to comment on pictures
13

As a Monster
so that I can be creative
I want to add filters to my pictures when I post them
20

As a Monster
so that I can categorise the pictures I post
I want to add tags to my pictures
20

As a Monster
so that I can tell a story
I want to be able to post multiple pictures
13