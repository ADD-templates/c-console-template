c-console-template/
├── Makefile                 # Configuración de compilación
├── README.md               # Documentación del proyecto
├── Dockerfile              # Imagen Docker para desarrollo y ejecución aislada
├── .dockerignore           # Exclusión de archivos innecesarios en Docker
├── .gitignore              # Exclusión de archivos y carpetas para Git
├── src/                    # Código fuente principal
│   ├── main.c             # Punto de entrada de la aplicación
│   ├── algorithms/        # Algoritmos de práctica
│   │   ├── sorting.c      # Algoritmos de ordenamiento
│   │   ├── searching.c    # Algoritmos de búsqueda
│   │   └── graph.c        # Algoritmos de grafos
│   ├── data_structures/   # Estructuras de datos
│   │   ├── linked_list.c  # Lista enlazada
│   │   ├── stack.c        # Pila
│   │   ├── queue.c        # Cola
│   │   └── binary_tree.c  # Árbol binario
│   └── utils/             # Utilidades generales
│       ├── input.c        # Manejo de entrada de usuario
│       └── timer.c        # Medición de tiempo de ejecución
├── include/               # Archivos de cabecera (.h)
│   ├── config.h          # Configuraciones globales
│   ├── algorithms/
│   │   ├── sorting.h
│   │   ├── searching.h
│   │   └── graph.h
│   ├── data_structures/
│   │   ├── linked_list.h
│   │   ├── stack.h
│   │   ├── queue.h
│   │   └── binary_tree.h
│   └── utils/
│       ├── input.h
│       └── timer.h
├── build/                 # Archivos de compilación (.o)
├── bin/                   # Ejecutables
├── tests/                 # Pruebas unitarias
│   ├── test_algorithms.c
│   └── test_data_structures.c
└── docs/                  # Documentación adicional
    └── algorithms_notes.md