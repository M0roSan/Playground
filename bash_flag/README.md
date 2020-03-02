# bash with flag

## Example 
user@comp:bash_flag (master) $ ./bash_flag.sh --help  
==================================  
* bash script to accept flags     *  
==================================  
./bash_flag.sh [options]  
  
 Options:  
  -f|--foo:       Print foo  
  -b|--bar:       Print arg passed to bar  
  -h|--help:      Help  
user@comp:bash_flag (master) $ ./bash_flag.sh --foo  
foo is called  
user@comp:bash_flag (master) $ ./bash_flag.sh --bar  
./bash_flag.sh: option '--bar' requires an argument  
user@comp:bash_flag (master) $ ./bash_flag.sh --bar hello  
bar is called with argument hello  