/* inorder to speed up query1, 3, 5 */
create index aid on actor(id);

/* inorder to speed up query2 */
create index gmid on genre(mid);    

/* inorder to speed up query1, 3, 5 */
create index cmid on casts(mid);

/* inorder to speed up query1, 3, 5 */
create index cpid on casts(pid);

/* inorder to speed up query3, 5 */
create index myear on movie(year);

/* inorder to speed up query1, 3, 4, 5 */
create index mid on movie(id);

/* inorder to speed up query2, 4 */
create index mdmid on movie_directors(mid);

/* inorder to speed up query2, 4 */
create index mddid on movie_directors(did);