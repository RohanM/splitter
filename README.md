# Splitter

A simple split test app using Sinatra.


## UI Design

There will be a home page. There will be two versions of this page, which will be randomly chosen.
Each page will have its own call to action, which links to a single following page.


## Software Design

### Recording the data

The CTA link will have a GET var, split_source, which identifies which view the click came from.
The source will be recorded by a universal before filter.
The data will be recorded in a DB table splits, with the columns: experiment, path, source


### Viewing stats

There will be an admin page that shows statistics for all experiments / paths.
