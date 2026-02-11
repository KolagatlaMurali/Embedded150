#include "utils.h"     // Includes util.h file
#include <unistd.h>   // Provides the sleep() function for Linux-based systems

// Entry point of the program
void main()
{
    // Infinite loop to repeatedly execute the task
    while (1)
    {
        // Print a log message 
        Print_Logs("Hello There - CMake");

        // Delay execution for 5 seconds
        sleep(5);
    }
}