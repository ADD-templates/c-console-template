
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "utils/input.h"
#include "config.h"

int get_int_input() {
    char buffer[MAX_STRING_LENGTH];
    int value;
    int attempts = 0;
    
    while (attempts < MAX_INPUT_ATTEMPTS) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            // Remover newline si existe
            size_t len = strlen(buffer);
            if (len > 0 && buffer[len - 1] == '\n') {
                buffer[len - 1] = '\0';
            }
            
            // Validar que solo contenga dígitos (y opcionalmente signo negativo)
            char *endptr;
            value = (int)strtol(buffer, &endptr, 10);
            
            if (*endptr == '\0' && strlen(buffer) > 0) {
                return value;
            }
        }
        
        attempts++;
        if (attempts < MAX_INPUT_ATTEMPTS) {
            printf(RED "Entrada inválida. Intenta de nuevo: " RESET);
        }
    }
    
    printf(RED "Demasiados intentos inválidos. Usando valor por defecto: 0\n" RESET);
    return 0;
}

void clear_input_buffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}