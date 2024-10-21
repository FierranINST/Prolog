% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra
%              el penúltimo elemento de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para encontrar el penúltimo elemento de una lista.
%     static T Penultimate<T>(List<T> list)
%     {
%         if (list == null || list.Count < 2)
%             throw new ArgumentException("La lista debe tener al menos dos elementos.");
%         
%         return list[list.Count - 2];
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         int penultimoElemento = Penultimate(lista);
%         Console.WriteLine("El penúltimo elemento es: " + penultimoElemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado penultimate(X, List) que encuentra el
% penúltimo elemento X de la lista List.

% Caso base: el penúltimo elemento está cuando la lista tiene exactamente dos elementos.
penultimate(X, [X, _]).

% Caso recursivo: ignora el primer elemento y sigue evaluando la cola.
penultimate(X, [_|T]) :-
    penultimate(X, T).
% ----------------------------------------------
