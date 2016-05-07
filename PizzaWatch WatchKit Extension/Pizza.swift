//
//  Pizza.swift
//  PizzaWatch
//
//  Created by Nicolas Roman Toro on 5/5/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    var tamaño : String = "Chica"
    var masa : String = "Delgada"
    var queso : String = "Mozzarela"
    var ingredientes : [String] = []
    
    let tamañosDisponibles : [String] = ["Chica","Mediana","Grande"]
    let masasDisponibles : [String] = ["Delgada","Gruesa","Crujiente"]
    let quesosDisponibles : [String] = ["Mozzarela","Cheddar","Parmesano","Sin Queso"]
    let ingredientesDisponibles : [String] = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    
    // Función para elegir tamaño
    func eligeTamaño(indicePickerTamaño : Int) -> String {
        let tamañoElegido = tamañosDisponibles[indicePickerTamaño]
        return tamañoElegido
    }
    
    // Función para elegir masa
    func eligeMasa(indicePickerMasa : Int) -> String {
        let masaElegida = masasDisponibles[indicePickerMasa]
        return masaElegida
    }
    
    // Función para elegir queso
    func eligeQueso(indicePickerQueso : Int) -> String {
        let quesoElegido = quesosDisponibles[indicePickerQueso]
        return quesoElegido
    }
    
    // Creo array de ingredientes elegidos, inicializado en cero
    var arrayIngredientesElegidos : [String] = []
    
    // Función para agregar ingredientes
    func agregaIngredientes(ingredienteAgregado : String) -> [String] {
        arrayIngredientesElegidos.append(ingredienteAgregado)
        return arrayIngredientesElegidos
    }
    
    // Función para quitar ingredientes - busca index, remueve en index
    func quitaIngredientes(ingredienteQuitado : String) -> [String] {
        let indexParaRemover : Int = arrayIngredientesElegidos.indexOf(ingredienteQuitado)!
        arrayIngredientesElegidos.removeAtIndex(indexParaRemover)
        return arrayIngredientesElegidos
    }
}
