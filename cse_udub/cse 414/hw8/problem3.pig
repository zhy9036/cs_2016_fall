--node: 10
--runtime: 14mins


register s3n://uw-cse344-code/myudfs.jar


-- load the test file into Pig
-- raw = LOAD 's3n://uw-cse344-test/cse344-test-file' USING TextLoader as (line:chararray);
-- later you will load to other files, example:
raw = LOAD 's3n://uw-cse344/btc-2010-chunk-000' USING TextLoader as (line:chararray); 

-- parse each line into ntriples
ntriples = foreach raw generate FLATTEN(myudfs.RDFSplit3(line)) as (subject:chararray,predicate:chararray,object:chararray);

data_filter = FILTER ntriples by subject matches '.*rdfabout\\.com.*' PARALLEL 50;
data_filter2 = FILTER ntriples by subject matches '.*rdfabout\\.com.*' PARALLEL 50;
data_filter2_alias = foreach data_filter2 generate subject as subject2, predicate as predicate2, object as object2 PARALLEL 50;

--join two sets

data_join = join data_filter by object, data_filter2_alias by subject2 PARALLEL 50;

--remove duplicate 
data_join_distinct = distinct data_join PARALLEL 50;

--order data on predicate
data_join_distinct_ordered = order data_join_distinct by predicate asc PARALLEL 50; 

-- store the results in the folder /user/hadoop/example-results
store data_join_distinct_ordered into '/user/hadoop/example-results' using PigStorage();

