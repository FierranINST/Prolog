% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Extrae N números aleatorios de un
%              rango dado.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para extraer N números aleatorios de un rango dado.
%     static List<int> Lotto(int n, int m)
%     {
%         List<int> range = Enumerable.Range(1, m).ToList();
%         return RndSelect(range, n);
%     }
%
%     static List<T> RndSelect<T>(List<T> list, int count)
%     {
%         Random rand = new Random();
%         return list.OrderBy(x => rand.Next()).Take(count).ToList();
%     }
%
%     static void Main()
%     {
%         List<int> seleccion = Lotto(3, 10);
%         Console.WriteLine(string.Join(", ", seleccion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae N números aleatorios de un rango dado.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

main :-
    N = 6,           % número de elementos a seleccionar
    M = 49,          % límite superior del rango
    lotto(N, M, Resultado),
    format('Números seleccionados aleatorios: ~w~n', [Resultado]).

