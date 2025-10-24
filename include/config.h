#ifndef CONFIG_H
#define CONFIG_H

// Información del proyecto
#define VERSION "1.0.0"
#define PROJECT_NAME "Template C de programa de consola"

// Configuraciones de compilación
#ifdef DEBUG
    #define BUILD_MODE "DEBUG"
    #define DEBUG_PRINT(fmt, ...) printf("[DEBUG] " fmt, ##__VA_ARGS__)
#else
    #define BUILD_MODE "RELEASE"
    #define DEBUG_PRINT(fmt, ...) do {} while(0)
#endif

// Configuraciones de memoria
#define MAX_ARRAY_SIZE 10000
#define MAX_STRING_LENGTH 256
#define DEFAULT_BUFFER_SIZE 1024

// Códigos de colores para consola (ANSI)
#define RESET   "\033[0m"
#define BOLD    "\033[1m"
#define RED     "\033[31m"
#define GREEN   "\033[32m"
#define YELLOW  "\033[33m"
#define BLUE    "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN    "\033[36m"
#define WHITE   "\033[37m"

// Configuraciones de algoritmos
#define ENABLE_TIMING 1
#define SHOW_STEP_BY_STEP 0

// Configuraciones de entrada/salida
#define ENABLE_INPUT_VALIDATION 1
#define MAX_INPUT_ATTEMPTS 3

// Macros útiles
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define SWAP(a, b) do { \
    typeof(a) temp = (a); \
    (a) = (b); \
    (b) = temp; \
} while(0)

#endif // CONFIG_H