# =============================================================================
# Makefile para Proyecto de Algoritmos y Estructuras de Datos en C
# =============================================================================

# Variables de configuración
PROJECT_NAME = c-console-program
CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -pedantic -O2
DEBUG_FLAGS = -g -DDEBUG -O0
RELEASE_FLAGS = -O3 -DNDEBUG
LDFLAGS = -lm

# Directorios
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
BIN_DIR = bin
TEST_DIR = tests

# Archivos fuente
MAIN_SRC = $(SRC_DIR)/main.c
SOURCES = $(shell find $(SRC_DIR) -name "*.c" ! -name "main.c")
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
MAIN_OBJ = $(BUILD_DIR)/main.o

# Archivos de prueba
TEST_SOURCES = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJECTS = $(TEST_SOURCES:$(TEST_DIR)/%.c=$(BUILD_DIR)/test_%.o)
TEST_EXECUTABLES = $(TEST_SOURCES:$(TEST_DIR)/%.c=$(BIN_DIR)/%)

# Ejecutable principal
EXECUTABLE = $(BIN_DIR)/$(PROJECT_NAME)

# Objetivo por defecto
.DEFAULT_GOAL := all

# =============================================================================
# Objetivos principales
# =============================================================================

# Compilar todo (release por defecto)
all: release

# Compilación en modo release (optimizada)
release: CFLAGS += $(RELEASE_FLAGS)
release: $(EXECUTABLE)

# Compilación en modo debug
debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(EXECUTABLE)

# Crear el ejecutable principal
$(EXECUTABLE): $(MAIN_OBJ) $(OBJECTS) | $(BIN_DIR)
	@echo "Enlazando ejecutable: $@"
	$(CC) $(MAIN_OBJ) $(OBJECTS) -o $@ $(LDFLAGS)
	@echo "✓ Ejecutable creado: $@"

# =============================================================================
# Compilación de archivos objeto
# =============================================================================

# Compilar main.c
$(BUILD_DIR)/main.o: $(MAIN_SRC) | $(BUILD_DIR)
	@echo "Compilando: $<"
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Compilar archivos fuente en subdirectorios
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	@echo "Compilando: $<"
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# =============================================================================
# Objetivos para pruebas
# =============================================================================

# Compilar y ejecutar todas las pruebas
test: $(TEST_EXECUTABLES)
	@echo "Ejecutando pruebas..."
	@for test in $(TEST_EXECUTABLES); do \
		echo "Ejecutando: $$test"; \
		$$test; \
	done

# Crear ejecutables de prueba
$(BIN_DIR)/test_%: $(BUILD_DIR)/test_%.o $(OBJECTS) | $(BIN_DIR)
	@echo "Enlazando prueba: $@"
	$(CC) $< $(OBJECTS) -o $@ $(LDFLAGS)

# Compilar archivos de prueba
$(BUILD_DIR)/test_%.o: $(TEST_DIR)/test_%.c | $(BUILD_DIR)
	@echo "Compilando prueba: $<"
	$(CC) $(CFLAGS) $(DEBUG_FLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# =============================================================================
# Objetivos de utilidad
# =============================================================================

# Ejecutar el programa principal
run: $(EXECUTABLE)
	@echo "Ejecutando $(PROJECT_NAME)..."
	./$(EXECUTABLE)

# Ejecutar con Valgrind para detectar memory leaks
valgrind: debug
	@echo "Ejecutando con Valgrind..."
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(EXECUTABLE)

# Limpiar archivos de compilación
clean:
	@echo "Limpiando archivos de compilación..."
	rm -rf $(BUILD_DIR)/* $(BIN_DIR)/*
	@echo "✓ Limpieza completada"

# Limpieza completa (incluye directorios)
distclean: clean
	@echo "Limpieza completa..."
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Crear estructura de directorios
dirs:
	@echo "Creando estructura de directorios..."
	mkdir -p $(SRC_DIR)/algorithms $(SRC_DIR)/data_structures $(SRC_DIR)/utils
	mkdir -p $(INCLUDE_DIR)/algorithms $(INCLUDE_DIR)/data_structures $(INCLUDE_DIR)/utils
	mkdir -p $(BUILD_DIR) $(BIN_DIR) $(TEST_DIR) docs

# Mostrar información del proyecto
info:
	@echo "=== Información del Proyecto ==="
	@echo "Nombre: $(PROJECT_NAME)"
	@echo "Compilador: $(CC)"
	@echo "Flags: $(CFLAGS)"
	@echo "Fuentes: $(words $(SOURCES)) archivos"
	@echo "Objetos: $(words $(OBJECTS)) archivos"
	@echo "Ejecutable: $(EXECUTABLE)"

# Mostrar ayuda
help:
	@echo "=== Makefile - Algoritmos y Estructuras de Datos ==="
	@echo ""
	@echo "Objetivos disponibles:"
	@echo "  all        - Compilar en modo release (por defecto)"
	@echo "  release    - Compilar optimizado para producción"
	@echo "  debug      - Compilar con información de debug"
	@echo "  test       - Compilar y ejecutar todas las pruebas"
	@echo "  run        - Compilar y ejecutar el programa"
	@echo "  valgrind   - Ejecutar con Valgrind para detectar memory leaks"
	@echo "  clean      - Limpiar archivos de compilación"
	@echo "  distclean  - Limpieza completa"
	@echo "  dirs       - Crear estructura de directorios"
	@echo "  info       - Mostrar información del proyecto"
	@echo "  help       - Mostrar esta ayuda"
	@echo ""
	@echo "Variables configurables:"
	@echo "  CC         - Compilador (actual: $(CC))"
	@echo "  CFLAGS     - Flags de compilación"
	@echo "  LDFLAGS    - Flags de enlazado (actual: $(LDFLAGS))"

# =============================================================================
# Creación de directorios
# =============================================================================

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# =============================================================================
# Objetivos que no crean archivos
# =============================================================================

.PHONY: all release debug test run valgrind clean distclean dirs info help

# =============================================================================
# Configuraciones adicionales
# =============================================================================

# Detectar cambios en headers para recompilación automática
$(BUILD_DIR)/%.o: $(wildcard $(INCLUDE_DIR)/*.h)
$(BUILD_DIR)/%.o: $(wildcard $(INCLUDE_DIR)/*/*.h)