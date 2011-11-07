# Splitter

A simple split test app using Sinatra and DataMapper.


## UI Design

* There will be a home page.
* There will be two versions of this page, which will be randomly chosen.
* Each page will have its own call to action, which links to a single following page.


## Software Design

### Recording the data

* The CTA link will have two GET vars, split_experiment and split_source, which identify which view the click came from.
* The source will be recorded by a universal before filter.
* The data will be recorded in a DB table split_data, with the columns: experiment, path, source.


### Viewing stats

There will be an admin page that shows statistics for all experiments / paths.
