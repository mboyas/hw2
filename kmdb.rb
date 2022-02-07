# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# I entered into terminal:
## rails generate model Movie
## rails generate model Person
## rails generate model Role

# Next, I added columns into db/migrate files
## Note - I used associations in the models to ease code below, so I used person_id in my movie table and person_id in roles table to make this work correctly

# Then, I executed migration by running in terminal:
## rails db:migrate

# Last, I added in relevant associations, see below:

# a movie has one director
##class Movie < ApplicationRecord
##    belongs_to :person
##end

# each persopn can be in many movies or many roles
##class Person < ApplicationRecord
##    has_many :movies
##    has_many :roles
##end

# each role has 1 person and 1 movie
##class Role < ApplicationRecord
##    belongs_to :person
##    belongs_to :movie
##end

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# Add people data into table

person1 = Person.new
person1.name = "Christian Bale"
person1.save

person2 = Person.new
person2.name = "Michael Caine"
person2.save

person3 = Person.new
person3.name = "Liam Neeson"
person3.save

person4 = Person.new
person4.name = "Katie Holmes"
person4.save

person5 = Person.new
person5.name = "Gary Oldman"
person5.save

person6 = Person.new
person6.name = "Heath Ledger"
person6.save

person7 = Person.new
person7.name = "Aaron Eckhart"
person7.save

person8 = Person.new
person8.name = "Maggie Gyllenhaal"
person8.save

person9 = Person.new
person9.name = "Tom Hardy"
person9.save

person10 = Person.new
person10.name = "Joseph Gordon-Levitt"
person10.save

person11 = Person.new
person11.name = "Anne Hathaway"
person11.save

person12 = Person.new
person12.name = "Christopher Nolan"
person12.save

# Add movie data into table

person = Person.where({name: "Christopher Nolan"})[0]
movie1 = Movie.new
movie1.title = "Batman Begins"
movie1.year_released = 2005
movie1.rated = "PG-13"
movie1.person_id = person.id
movie1.save

person = Person.where({name: "Christopher Nolan"})[0]
movie2 = Movie.new
movie2.title = "The Dark Knight"
movie2.year_released = 2008
movie2.rated = "PG-13"
movie2.person_id = person.id
movie2.save

person = Person.where({name: "Christopher Nolan"})[0]
movie3 = Movie.new
movie3.title = "The Dark Knight Rises"
movie3.year_released = 2012
movie3.rated = "PG-13"
movie3.person_id = person.id
movie3.save

# Add role data into table

person = Person.where({name: "Christian Bale"})[0]
movie = Movie.where({title: "Batman Begins"})[0]
role1 = Role.new
role1.movie_id = movie.id
role1.person_id = person.id
role1.character_name = "Bruce Wayne"
role1.save

person = Person.where({name: "Michael Caine"})[0]
movie = Movie.where({title: "Batman Begins"})[0]
role2 = Role.new
role2.movie_id = movie.id
role2.person_id = person.id
role2.character_name = "Alfred"
role2.save

person = Person.where({name: "Liam Neeson"})[0]
movie = Movie.where({title: "Batman Begins"})[0]
role3 = Role.new
role3.movie_id = movie.id
role3.person_id = person.id
role3.character_name = "Ra's Al Ghul"
role3.save

person = Person.where({name: "Katie Holmes"})[0]
movie = Movie.where({title: "Batman Begins"})[0]
role4 = Role.new
role4.movie_id = movie.id
role4.person_id = person.id
role4.character_name = "Rachel Dawes"
role4.save

person = Person.where({name: "Gary Oldman"})[0]
movie = Movie.where({title: "Batman Begins"})[0]
role5 = Role.new
role5.movie_id = movie.id
role5.person_id = person.id
role5.character_name = "Commissioner Gordon"
role5.save

person = Person.where({name: "Christian Bale"})[0]
movie = Movie.where({title: "The Dark Knight", year_released: 2008})[0]
role6 = Role.new
role6.movie_id = movie.id
role6.person_id = person.id
role6.character_name = "Bruce Wayne"
role6.save

person = Person.where({name: "Heath Ledger"})[0]
movie = Movie.where({title: "The Dark Knight", year_released: 2008})[0]
role7 = Role.new
role7.movie_id = movie.id
role7.person_id = person.id
role7.character_name = "Joker"
role7.save

person = Person.where({name: "Aaron Eckhart"})[0]
movie = Movie.where({title: "The Dark Knight", year_released: 2008})[0]
role8 = Role.new
role8.movie_id = movie.id
role8.person_id = person.id
role8.character_name = "Harvey Dent"
role8.save

person = Person.where({name: "Michael Caine"})[0]
movie = Movie.where({title: "The Dark Knight", year_released: 2008})[0]
role9 = Role.new
role9.movie_id = movie.id
role9.person_id = person.id
role9.character_name = "Alfred"
role9.save

person = Person.where({name: "Maggie Gyllenhaal"})[0]
movie = Movie.where({title: "The Dark Knight", year_released: 2008})[0]
role10 = Role.new
role10.movie_id = movie.id
role10.person_id = person.id
role10.character_name = "Rachel Dawes"
role10.save

person = Person.where({name: "Christian Bale"})[0]
movie = Movie.where({title: "The Dark Knight Rises", year_released: 2012})[0]
role11 = Role.new
role11.movie_id = movie.id
role11.person_id = person.id
role11.character_name = "Bruce Wayne"
role11.save

person = Person.where({name: "Gary Oldman"})[0]
movie = Movie.where({title: "The Dark Knight Rises", year_released: 2012})[0]
role12 = Role.new
role12.movie_id = movie.id
role12.person_id = person.id
role12.character_name = "Commissioner Gordon"
role12.save

person = Person.where({name: "Tom Hardy"})[0]
movie = Movie.where({title: "The Dark Knight Rises", year_released: 2012})[0]
role13 = Role.new
role13.movie_id = movie.id
role13.person_id = person.id
role13.character_name = "Bane"
role13.save

person = Person.where({name: "Joseph Gordon-Levitt"})[0]
movie = Movie.where({title: "The Dark Knight Rises", year_released: 2012})[0]
role14 = Role.new
role14.movie_id = movie.id
role14.person_id = person.id
role14.character_name = "John Blake"
role14.save

person = Person.where({name: "Anne Hathaway"})[0]
movie = Movie.where({title: "The Dark Knight Rises", year_released: 2012})[0]
role15 = Role.new
role15.movie_id = movie.id
role15.person_id = person.id
role15.character_name = "Selina Kyle"
role15.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
for movie in movies
    puts "#{movie.title.ljust(21)} #{movie.year_released} #{movie.rated} #{movie.person.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

roles = Role.all
for role in roles
    puts "#{role.movie.title.ljust(21)} #{role.person.name.ljust(20)} #{role.character_name}"
end