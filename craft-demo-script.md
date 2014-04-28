# Craft Demo Script

Before each section, use Alfred to run `craftdemo 01`. This will discard unsaved git changes, create a new branch from the passed tag (e.g. 01, 02), and update the local database data.


## Prologue: Why Craft?

- **Sweetspot Feature Set:** first-class support for most common scenarios, but not bloated with crap.
- **Flexibility:** Craft is built around some key concepts – sections, fields, entries, relationships – that are very flexible. It's pretty easy to fit craft to the needs of most projects.
- **Templating:** Craft uses Twig, a robust templating language that is pretty nice to work with. No PHP in templates. Very designer-friendly.
- **Support:** The Craft support team is great,and the community is growing fast.
- **Routing:** Craft comes with built in support for Routing, including a simple, easy-to-understand set of default routes, and the ability to easily define custom routes in a way that actually makes sense.
- **ExpressionEngine Legacy:** Pixel & Tonic made the best EE plugins for many years, and they've brought all of that experience to Craft. Craft includes pretty much all of the features of their EE plugins by default, including matrix and relationships. It also borrows from the good EE concepts while throwing the many bad ones away.


## 01: Fresh Download

Completely fresh, untouched Craft Download.

- Briefly explain how the default Craft folder structure works, and the most common way to prep it for development.
- Move contents of `/public` folder into root.
- Open `index.php` and change `$craftPath = '../craft';` to `$craftPath = 'craft';`
- Open `/craft/config/general.php` and add `omitScriptNameInUrls' => true` to the array.
- Rename `htaccess` to `.htaccess`. Combined with the above, this will remove `index.php` from URLs.


## 02: Installation, Routes, Templates, and Sections

Includes a fully-built-out project structure, ready for Craft installation.

- We're using Gulp for a basic task runner and server. Handles Sass compilation, LiveReload, etc.
- `npm install`
- `gulp`

- I've already created a MySQL database called `craft_demo`
- `/craft/config/db.php` is where we define our database connection. You can also set this to be unique to each dev, staging, and production server environment, which we'll talk about later. For now we've just set this to connect to a local MySQL server.

- Visit [http://http://dev.craft-demo.com/admin/](http://http://dev.craft-demo.com/admin/) and go through install process.
- Assign username `admin` and password `password`
- Talk a bit about the Dashboard, including how you can customize it.

- Go back to [http://dev.craft-demo.com/](http://dev.craft-demo.com/).

- Open `/craft/templates` in Sublime Text.
- For the route URL route, Craft automatically looks for an `index.html` file. Let's look at that file.
- Craft templates use the concept of `blocks` for templating.
- Several things are happening in this file:
    1. We're _extending_ `_layout.html`, which means we want to use that as a wrapper for this template.
    2. We're defining the markup that should appear in the `content` block.
    3. We're displaying the `heading` and `body` fields for this _Entry_
    4. We're looping through all entries in the _News_ section, limit to 5 entries, and displaying them.

Let's talk about each of things things individually real quick:

### Extending and blocks:

- Open `/craft/templates/_layout.html`
- If we scroll down and look in `<main id="content">`, we see `{% block content}`
- Notice how that block has the same name that we saw in `index.html`? When we extended `_layout.html`, we said "Replace any blocks in that template with the blocks defined in this file, then render that template". 
- If a block is defined in the layout, but not in the template, it will use the default block content form the layout. That's what we see inside the `{% block content}` of `_layout.html`
- If we look at the default `404.html` template, we can see it's basically doing the same thing as `index.html`, just defining different block content.
- `404.html` is also passing a `title` variable up to the layout. If we look in the layout we can see that it is checking for a `title` variable, and if it finds it will prepend it to the site name.

### Outputting Entry Fields

- Twig, the templating language used by Craft, has two types of tags: `{% %}` and `{{ }}`
- If you're familiar with other templating languages these shouldn't be too difficult to understand.
- `{% %}` runs code without outputting it, similar to `<% %>` in erb.
- `{{ }}` outputs the results, similar to `<%= %>` in erb.
- The `{{ entry.heading }}` and `{{ entry.body }}` tags are taking the current entry, looking for fields called `heading` and `body`, and outputting them.
- But what is an entry? How does the template know what entry to work with?
- Go to [http://dev.craft-demo.com/admin/dashboard](http://dev.craft-demo.com/admin/dashboard) and click `Entries`
- Turns out there is a an entry called `Homepage`. Every Craft site has one (and only one) Homepage entry, and Craft knows to use it when displaying the index route.

### Entries and Entry Routes

- Back on the site's index, we saw that it was looping through all News entries and displaying them.
- If we click on one of the news items, we can see that it uses the same layout and the URL is `/news/2014/we-just-installed-craft`.
- When craft sees this URL, it looks for a directory in `/craft/templates` called `news`, then it looks within that for a `_entry.html` template to use for display the entry content.
- If we look in `/news/_entry.html`, there's nothing in here that we haven't seen before. It's extending `_layout.html` and setting the `content` block with the details of the entry.
- If we view the [entry in the Craft Admin](http://dev.craft-demo.com/admin/entries/news/3), we can see that it has a `title` and `body`.
- It also has a few details that `Homepage` didn't, because Homepage is what Craft calls a _Single_ entry, meaning there is only one of them in the site and they usually match a single page of the site, while `News` is a _Channel_ entry, meaning there's probably a bunch of them.
- If we click `Live Preview` we get a live editing view of the entry.

### Adding new entries

- Let's add a News entry. Go to `Entries`, then click `New Entry`. Give it some details, then click Save. We'll see out new entry.
- When we were looking at our templates, we also saw an `index.html` route in `/templates/news`.
- If we visit [http://dev.craft-demo.com/news/](http://dev.craft-demo.com/news/), Craft knows that we're not looking at an individual entry, so it shows the index route for the `News` section.
- You can probably guess what that template is doing. It's just looping through all news items and displaying them.

### Sections

- So what are Homepage and News? How does Craft know what fields we want them to include?
- They are both sections, and we can find out more about them by visiting [http://dev.craft-demo.com/admin/settings](http://dev.craft-demo.com/admin/settings) and clicking on `Sections`.
- We see our two sections, we can see their `type`, a preview of their route format, etc.
- If we click on `Homepage`, we'll see that we can edit everything about it. We can also see that the template it uses is customizable, it just happens to use `index` by default.
- If we edit the `News` section, we'll see that we also also edit the format of its route. One of the cool things about Craft is that most admin fields can include tags, so here we're using the `postDate` and `slug` properties of each entry to build its route.

### Fields

- Every section entry has `fields`, like `title`, `body`, etc.
- We set which fields we want a section entry to include by editing its Entry types.
- Section Entry Types offer a lot of flexibility: for instance, the News section could include both `Weather` and `Crime` Entry types. Entry types are essentially just a way of organizing, and aren't necessary. In fact, much of the time you won't even need more than one entry type for a section.
- Click 'Edit entry types` next to the `News` section, then edit the one existing entry type.
- Here we have the ability to add, remove, or rearrange the fields used by News. If your entry type has a lot of content, you can even get more organized by adding multiple tabs, but you usually won't need to.
- You can also set fields as being required.

### Adding a new field
- Let's say we want to add a new `location` field to News.
- Go to the [Settings > Fields](http://dev.craft-demo.com/admin/settings/fields) area, then click `New Field`.
- Call the field `location`, add some helpful instructions, and set the placeholder type. While we're here take a look at the many different field types, a few of which we'll talk about later.
- Click `Save`. Now we need to tell the News section to use this field.
- Go back to [Settings > Sections > News > Edit Entry Types](http://dev.craft-demo.com/admin/settings/sections/2/entrytypes/2) and we'll see a new `Location` field under `Default`. Just drag it up to our Field Layout, and click `Save`.
- Now if we go to `Entries` and edit one of our News entries, we'll see our new `location` field ready to use.
- To output this, we'd just add an `{{ entry.location }}` tag to any of our News templates.