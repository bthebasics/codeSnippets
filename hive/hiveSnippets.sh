## Important code snippets for hive
set mapred.reduce.tasks=1000;
set hivevar:buckets=10000;
# hivevar:buckets should be high enough relatively to the number of reducers (mapred.reduce.tasks), so the rows will be evenly distributed between the reduces.

select  1 + x + (row_number() over (partition by x) - 1) * ${hivevar:buckets}  as id
       ,t.*

from   (select  t.*
               ,abs(hash(rand())) % ${hivevar:buckets} as x

        from    t
        ) t
##spark-sql
select  1 + x + (row_number() over (partition by x) - 1) * 10000  as id
       ,t.*

from   (select  t.*
               ,abs(hash(rand())) % 10000 as x

        from    t
        ) t

##        For both hive and spark-sql
##        The rand() is used to generate a good distribution.
##        If You already have in your query a column / combination of columns with good distribution (might be unique, not a must) you might use it instead, e.g. -

        select    1 + (abs(hash(col1,col)) % 10000)
                + (row_number() over (partition by abs(hash(col1,col)) % 10000) - 1) * 10000  as id
               ,t.*

        from    t
