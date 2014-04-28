# Craft Demo

A walkthrough of the capabilities of [Craft](http://www.buildwithcraft.com)

## Installing:

You'll need [Node.js and npm](http://nodejs.org) installed before you do anything else.

**Install Non-Node Dependencies**

```
gem install sass

# or if you already have Sass installed, make sure you're running the latest

gem update sass
```

**Install Front-end Tools**

From within the project directory, run the following:

```
npm install -g gulp
npm install
```

## Development:

Gulp handles the build process for the project, including the following:

- Pre-processes [Sass](http://sass-lang.com/) stylesheets
- Uses [LiveReload](http://livereload.com/) to automatically refresh the browser when files change

Start the gulp watch server with:

```
gulp
```

For deployment, build the site with:

```
gulp build
```
