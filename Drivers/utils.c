#include <stdio.h> 
#include <time.h>

// Function to print log messages to the standard output
void Print_Logs(char *String)
{
    time_t Now;
    struct tm time_date;
    char timebuf[50];

    // Get current system time
    time(&Now);

    // Convert to local time 
    localtime_r(&Now, &time_date);

    // Format date and time into buffer
    strftime(timebuf, sizeof(timebuf),
             "%Y-%m-%d %H:%M:%S", &time_date);

    // Print timestamped log message
    printf("%s:%s\r\n", timebuf, String);
}