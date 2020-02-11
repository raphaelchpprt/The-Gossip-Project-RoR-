# README

This app is made as part of the bootcamp The Hacking Project. 
It aims at creating a realistic database in Ruby on Rails that represents a Airbnb for dogsitter website : dogsitter make strolls with dogs and both of them are tight to a city.

## The Ruby version 
The ruby version used is 2.5.1.
The rails version used is volontarily 5.2.3.

## Install from your console

`git clone https://github.com/estelle-rcr/THP-Gossip-rails-mvc.git`

Install the bundle:
  `bundle install`
  
Create the database:
  `rails db:create`

Migrate the database:
  `rails db:migrate`
  
Seed the database:
  `rails db:seed`

Finally launch the server:
  `rails server`

And then access the localhost accordingly, for instance:
  `http://localhost:3000/`


## Additional Gems used
We have used some additional Gems such as:

Faker gem for generating random data


## Start playing around with the database in the sandbox:
To use, please follow these commands:
`rails console --sandbox`

The tables in the database are:
- users (that can be called as 'author' of gossips)
- gossips
- cities
- tags
- join_table_gossip_tags

### Run tests yourself:

* The database has been seeded to enable testing. To do that, first launch your rails console from your terminal in test environment, so that nothing will be saved:

`rails console --sandbox`

* You can try various method using the class from the tables, such as this one for knowing how many doctors have the specialty with the id 54 :

`@gossips = Gossip.all`
  `gossips.author`

*Visit the URLs:
  `http://localhost:3000/`
    `http://localhost:3000/contact/`
      `http://localhost:3000/team/`
        `http://localhost:3000/gossip/3`
          `http://localhost:3000/user/3`

  Access a special page where you're welcomed according to the parameter in the URL:
  `http://localhost:3000/welcome/anyone-you-would-like`
    `http://localhost:3000/welcome/5` 

