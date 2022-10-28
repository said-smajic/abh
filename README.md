Project task:
Create a Bash script as follow:
* The script should be named "logs_stats.sh"
* Users should be able to execute the script from its directory with command: ./logs_stats.sh <args>
* Ensure that script is executed by bash shell (not default shell) if run as described in previous step
* The script should accept two arguments: first one representing path of directory containing apache logs (example: /tmp/logs), and second one representing search string within logs (example, we can search for browser name: Chrome/, Mozilla/, Safari/ etc.)
* If no arguments are passed to the script, it should display message showing how to use the script
* The script should verify/check if first argument is valid path and directory exists, otherwise show error message
* Once executed with proper arguments (example: ./logs_stats.sh /tmp/logs 'Chrome/'), the script should display stats for all log files under logs directory (first argument) showing:
    * file name
    * file size in human readably format
    * total lines count for a file
    * count of lines containing search word (second argument)
* Bonus points if output is sorted by "search word count" column descending.
  
  Everything is done. 
  
  **Example how to run the script: ./logs_stats.sh /home/ubuntu/Desktop/Bash/tmp/logs/ specific_word**
