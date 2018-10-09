#step 1 : create a tmp directory
hadoop fs -mkdir tmp
#step 2 : move all the small files to the tmp directory at a point of time
hadoop fs -mv input/*.txt tmp
#step 3 -merge the small files with the help of hadoop-streaming jar
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
                   -Dmapred.reduce.tasks=1 \
                   -input "/user/abc/input" \
                   -output "/user/abc/output" \
                   -mapper cat \
                   -reducer cat
# ref : https://stackoverflow.com/questions/39103872/merging-small-files-in-hadoop
