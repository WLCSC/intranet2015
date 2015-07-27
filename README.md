# About

This is the redesigned 2015 Intranet for West Lafayette Community School Corporation.

This makes notes and holds references for the students in the school corporation.  The notes are notices intended for anyone in the school corporation which are made by faculty and can have expiration dates.  The references hold the name of an online reference site, a link to that site, the user name and password (if applicable) for the site, whether it can be accessed at home, and any extra notes about that specific site.  The menu can also be modified in the menu editor by faculty, and menu items can have links and parents.

#Setup

```sh
gem install bundler # if you don't have bundler
bundle install # get the missing gems
cp config/ldap.yml.sample config/ldap.yml
rake db:migrate
```

#Running the server

```sh
rails s
```
