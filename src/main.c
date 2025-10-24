#include <stdio.h>
#include <stdlib.h>
#include "config.h"
#include "utils/input.h"
//#include "algorithms/sorting.h"
//#include "data_structures/linked_list.h"

void show_menu() {
    printf("\n" BOLD "=== Algoritmos y Estructuras de Datos ===" RESET "\n");
    printf("1. Algoritmos de Ordenamiento\n");
    printf("2. Estructuras de Datos\n");
    printf("3. Algoritmos de Búsqueda\n");
    printf("0. Salir\n");
    printf("Selecciona una opción: ");
}

int main() {
    printf(GREEN "Bienvenido al proyecto de Algoritmos y Estructuras de Datos\n" RESET);
    printf("Versión: %s\n", VERSION);
    printf("Compilado en modo: %s\n\n", BUILD_MODE);
    
    int option;
    
    do {
        show_menu();
        option = get_int_input();
        
        switch (option) {
            case 1:
                printf(BLUE "\n--- Algoritmos de Ordenamiento ---\n" RESET);
                // TODO: Implementar menú de algoritmos de ordenamiento
                break;
            case 2:
                printf(BLUE "\n--- Estructuras de Datos ---\n" RESET);
                // TODO: Implementar menú de estructuras de datos
                break;
            case 3:
                printf(BLUE "\n--- Algoritmos de Búsqueda ---\n" RESET);
                // TODO: Implementar menú de algoritmos de búsqueda
                break;
            case 0:
                printf(GREEN "\n¡Gracias por usar el programa!\n" RESET);
                break;
            default:
                printf(RED "Opción inválida. Intenta de nuevo.\n" RESET);
        }
    } while (option != 0);
    
    return EXIT_SUCCESS;
}