//
//  ConfirmaPizza.swift
//  PizzaWatch
//
//  Created by Nicolas Roman Toro on 5/7/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmaPizza: WKInterfaceController {
    
    // Creo pizza
    var pizzaFinal : Pizza = Pizza()
    
    // Conecto labels
    @IBOutlet var etiquetaTamaño: WKInterfaceLabel!
    @IBOutlet var etiquetaMasa: WKInterfaceLabel!
    @IBOutlet var etiquetaQueso: WKInterfaceLabel!
    @IBOutlet var etiquetaIngredientes: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Actualizo valores de labels con elecciones anteriores
        let c = context as! Pizza
        etiquetaTamaño.setText(c.tamaño)
        etiquetaMasa.setText(c.masa)
        etiquetaQueso.setText(c.queso)
        etiquetaIngredientes.setText(c.ingredientes.joinWithSeparator(", "))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func confirmaPizzaFinal() {
        print("Pizza Confirmada")
        print("Ingredientes son \(pizzaFinal.arrayIngredientesElegidos.joinWithSeparator("-"))")
    }
}
