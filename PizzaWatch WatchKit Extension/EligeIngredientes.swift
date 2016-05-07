//
//  EligeIngredientes.swift
//  PizzaWatch
//
//  Created by Nicolas Roman Toro on 5/6/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit
import Foundation


class EligeIngredientes: WKInterfaceController {
    
    // Conecto Tabla
    @IBOutlet var tablaIngredientes: WKInterfaceTable!
    
    // Conecto labels
    @IBOutlet var etiquetaTamaño: WKInterfaceLabel!
    @IBOutlet var etiquetaMasa: WKInterfaceLabel!
    @IBOutlet var etiquetaQueso: WKInterfaceLabel!
    
    // Defino variable Pizza
    var pizzaIngrediente : Pizza = Pizza()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Creo array de ingredientes
        let arrayIngredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
        
        // Defino número de rows en Table
        tablaIngredientes.setNumberOfRows(arrayIngredientes.count, withRowType: "rowIngrediente")
        
        // Popular la tabla        
        for i in 0 ..< arrayIngredientes.count {
            let row = tablaIngredientes.rowControllerAtIndex(i) as? rowController
            let labelValue = arrayIngredientes[i]
            
            row!.rowLabel.setText(labelValue)
        }
        
        // Actualizo valores de labels y de la nueva variable pizza
        let c = context as! Pizza
        etiquetaTamaño.setText(c.tamaño)
        etiquetaMasa.setText(c.masa)
        etiquetaQueso.setText(c.queso)
        // Actualizo pizza
        pizzaIngrediente.tamaño = c.tamaño
        pizzaIngrediente.masa = c.masa
        pizzaIngrediente.queso = c.queso
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Agregar ingredientes cada vez que se selecciona una row
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = tablaIngredientes.rowControllerAtIndex(rowIndex) as? rowController
        let ingredienteAgregado : String = (row?.rowLabel.description)!
        pizzaIngrediente.arrayIngredientesElegidos.append(ingredienteAgregado)
        print(pizzaIngrediente.arrayIngredientesElegidos.joinWithSeparator("-"))
    }

    @IBAction func confirmaIngredientes() {
        pushControllerWithName("PizzaConfirmada", context: pizzaIngrediente)
        print("Se seleccionaron los ingredientes")
    }
}
