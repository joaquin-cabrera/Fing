/* 5004787 */
/*
  Módulo de implementación de `cronologia_consistente'.

  Laboratorio de Programación 3.
  InCo-FIng-UDELAR
*/
#include <stdio.h>

#include "../include/cronologia_consistente.h"
#include "../include/grafo.h"
#include "../include/lista_datos.h"
#include "../include/lista.h"
#include "../include/utils.h"



Cronologia cronologia_consistente(nat n, ListaDatos tipo1, ListaDatos tipo2){

  bool existe_cr_consistente = false; 

  Cronologia cr = new evento[2*n]; 

  Grafo g = crear_grafo(n, true);
  ListaDatos lista1 = tipo1;
  ListaDatos lista2 = tipo2;        

  while (!es_vacia_lista_datos(lista1)){
    dato d = primer_dato(lista1);
    nat vertice1 = id1(d);
    nat vertice2 = id2(d);
    agregar_vertice(vertice1, g);
    agregar_vertice(vertice2, g);
    agregar_arista(vertice1, vertice2, g);
    lista1 = resto_datos(lista1);
  }


  while (!es_vacia_lista_datos(lista2)){
    dato d = primer_dato(lista2);
    nat vertice1 = id1(d);
    nat vertice2 = id2(d);
    agregar_vertice(vertice1, g);
    agregar_vertice(vertice2, g);
    agregar_arista(vertice1, vertice2, g);
    agregar_arista(vertice2, vertice1, g);
    lista2 = resto_datos(lista2);
  }
  

  Lista listaVertices = vertices(g);
  existe_cr_consistente = es_orden_topologico(listaVertices, g);



  // Determinar si existe o no una cronología consistente con los datos, 
  // en caso de existir, construirla en cr 

  if(existe_cr_consistente) { // si existe, retornarla en cr
    destruir_lista(listaVertices);
    destruir_grafo(g);
    return cr;
  } 
  else {    // si no existe, liberar la memoria asociada a cr y retornar NULL   
    destruir_lista(listaVertices);
    destruir_grafo(g);
    delete[] cr;
    return NULL;
  }

} 
