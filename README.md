#### ENV use in project

APP_ENV=${APP_ENV:-prod}   
**local prod test**  

XDEBUG_MODE=${XDEBUG_MODE:-off}  
**off**  
Nothing is enabled. Xdebug does no work besides checking whether functionality is enabled. Use this setting if you want close to 0 overhead.  
**develop**  
Enables Development Helpers including the overloaded var_dump().  
**coverage**  
Enables Code Coverage Analysis to generate code coverage reports, mainly in combination with PHPUnit.  
**debug**  
Enables Step Debugging. This can be used to step through your code while it is running, and analyse values of variables.  
**gcstats**  
Enables Garbage Collection Statistics to collect statistics about PHP's Garbage Collection Mechanism.  
**profile**  
Enables Profiling, with which you can analyse performance bottlenecks with tools like KCacheGrind.  
**trace**  
Enables the Function Trace feature, which allows you record every function call, including arguments, variable assignment, and return value that is made during a request to a file.  

xdebug.client_host=${XDEBUG_CLIENT_HOST:-localhost}
**XDEBUG_CLIENT_HOST=host.docker.internaly**