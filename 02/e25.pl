% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Genera una permutación aleatoria de
%              una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%     // Función para generar una permutación aleatoria de una lista.
%     static List<T> RndPermu<T>(List<T> list)
%     {
%         Random rand = new Random();
%         return list.OrderBy(x => rand.Next()).ToList();
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> permutacion = RndPermu(lista);
%         Console.WriteLine(string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae un número dado de elementos aleatorios de una lista.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    Len > 0,  % Verifica que la longitud de la lista sea mayor que 0
    (Len =:= 1 -> I = 1 ; random(1, Len, I)),  % Si Len es 1, elige el primer elemento
    element_at(X, L, I),
    delete(L, X, L1),
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Genera una permutación aleatoria de los elementos de una lista.
rnd_permu(L, P) :- length(L, Len), Len > 0, rnd_select(L, Len, P).

% Encuentra el elemento en la posición I de la lista.
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- I > 1, I1 is I - 1, element_at(X, T, I1).

% Punto de entrada principal.
main :-
    Lista = [a, b, c, d, e],  % lista de entrada para la permutación
    rnd_permu(Lista, Permutacion),
    format('Permutación aleatoria: ~w~n', [Permutacion]).
