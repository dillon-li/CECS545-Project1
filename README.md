# TSP
Traveling Salesman for AI class. Done in Matlab.   
Refer to assignment pdf for details on the assignment.
Brute Forces TSP, so don't count on it working for above 13 cities.

# Running the Code
Keep the same project structure as the git repository.  
Run the script as: 
```
TSP(<filename>);
```  
Or if you want results saved into your workspace variables:  
```
[distMin winningPath] = TSP(<filename>);
```
  
Example Call:  
```
[distMin winningPath] = TSP('Random4.tsp');
``` 

## Extra Notes  
The files processed are generated by concorde as specified in the assignment pdf. Examples are provided in the repo. 
The code operates under the assumption that the passed in .tsp file is in this format.  
  
Code was tested and run in Windows using Matlab 2016b.
