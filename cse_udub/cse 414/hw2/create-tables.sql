/*cse 414 hw2*/

CREATE TABLE actor(id int primary key, fname text, lname text, gender text);
CREATE TABLE casts(pid int references actor(id), mid int references movie(id), role text);
CREATE TABLE directors(id int primary key, fname text, lname text);
CREATE TABLE genre(mid int, genre text);
CREATE TABLE movie(id int primary key, name text, year int);
CREATE TABLE movie_directors(did int references directors(id), mid int references movie(id));

.import movie-ascii.txt movie
.import actor-ascii.txt actor
.import genre-ascii.txt genre
.import directors-ascii.txt directors
.import casts-ascii.txt casts
.import movie_directors-ascii.txt movie_directors