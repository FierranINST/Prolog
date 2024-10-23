# Makefile para automatizar la ejecución de los ejercicios de Prolog

# Variable que contiene el intérprete de Prolog
SWIPL = swipl

# Archivos fuente de los primeros 30 ejercicios
SOURCES = e1.pl e2.pl e3.pl e4.pl e5.pl e6.pl e7.pl e8.pl e9.pl e10.pl \
          e11.pl e12.pl e13.pl e14.pl e15.pl e16.pl e17.pl e18.pl e19.pl e20.pl \
          e21.pl e22.pl e23.pl e24.pl e25.pl e26.pl e27.pl e28.pl e29.pl e30.pl

# Objetivo por defecto
all: run

# Comando para ejecutar todos los ejercicios
run: $(SOURCES)
	@for file in $(SOURCES); do \
		echo "Ejecutando $$file..."; \
		$(SWIPL) -s $$file -g main -t halt; \
	done

# Limpiar (en este caso, no genera archivos intermedios, pero lo dejamos como plantilla)
clean:
	@echo "Nada que limpiar"

# Indica que 'clean' no es un archivo
.PHONY: all run clean

