# RackDemo
A Ruby web app tutorial ( not using in Rails )

for comparing performance of this app with Rails you can use apache benchmarks(ab)

ab -n <num_requests> -c <concurrency> <addr>:<port><path>

ab -n 1000 -c 100 -t10 http://localhost:9292/?name=ravi

-n requests     Number of requests to perform
-c concurrency  Number of multiple requests to make
-t timelimit    Seconds to max. wait for responses