# Lucky Charms [![Build Status](https://travis-ci.org/drapergeek/luckycharms.png)](https://travis-ci.org/drapergeek/luckycharms) [![Code Climate](https://codeclimate.com/github/drapergeek/luckycharms.png)](https://codeclimate.com/github/drapergeek/luckycharms)

## What is it?

Lucky Charms is a small web based application for serving URLs to a 'unit'. It
is primarily driven by an API though it does have a web interface for most
things.

## What is a unit?

A unit is anything that is designed to display a web page full screen and to hit
this API. For our purposes, we have written a small iOS app called
'Marshmallow' that is designed to run on an iPod touch. Marshmallow is not yet
completed therefore it is not yet open source but it should be soon.

## What good does all this do?

Ideally, in an office you may have multiple TVs that are set up for showing
things like dashboards. Depending on the TV, you may want to show different
things on the TV at different points, this allows you to easily tell a TV to
display a different web page using a very simple API. Combining Marshallow and
LuckyCharms now you have a cheap device that you can attach to your TV and
display these dashboards with ease.

Ideally, you would tie lucky charms into your campfire or IRC bot to make it
very easy to push new information to the screens.

## Features

### API Features
All the API features below are explained using commands as if they are given to your
campfire bot. The most common bot is hubot so we used that name.

    # show a URL on a unit
    hubot luckycharms show http://mydashboard.com on frontofficetv

    # bookmark a common URL
    hubot luckycharms bookmark http://itdashboard.com as itdashboard

    # show all bookmarks
    hubot luckycharms bookmarks

### Other Features

* Automatic registration of units as long as registration is turned on.
* Ability to see a list of all units and change their names and store other
  common information about the unit such as location.
* Lost mode! If you're not sure where a unit is by its name, you can
  put it into lost mode and the unit will display the unit's name in very large
format across the screen so that you can easily look through your building for
the unit. It can also display a string of custom text such as 'If you see this
please call 555-5555' on the unit.
* Unit's check-in information. LuckyCharms will track each time a unit checks
  into the server and record that information. If a unit does not check-in
within a certain time period (user configurable), the administrators will be
notified.
* Easy overhead view of what all units are currently showing.
* Ability to group units so that the same thing can be displayed easily on
  multiple units.
* Ability to deactivate units if an API key is compromised.

## Development Setup

```
  git clone git@github.com:drapergeek/luckycharms.git
  ./bin/setup
```
