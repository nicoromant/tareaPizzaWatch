//
//  EligeQueso.swift
//  PizzaWatch
//
//  Created by Nicolas Roman Toro on 5/6/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit
import Foundation


class EligeQueso: WKInterfaceController {
    
    // Conecto labels Tamaño y Masa para mostrar elecciones anteriores
    @IBOutlet var etiquetaTamaño: WKInterfaceLabel!
    @IBOutlet var etiquetaMasa: WKInterfaceLabel!
    
    // Defino outlet del Picker
    @IBOutlet var pickerQuesos: WKInterfacePicker!
    
    // Defino variable pizza
    var pizzaQueso : Pizza = Pizza()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Actualizo labels con elecciones anteriores
        let c = context as! Pizza
        etiquetaTamaño.setText(c.tamaño)
        etiquetaMasa.setText(c.masa)
        // Actualizo valores tamaño y masa para pasarlos a siguiente pantalla
        pizzaQueso.tamaño = c.tamaño
        pizzaQueso.masa = c.masa
        
        // Creo array de quesos y seteo contenidos del picker
        let queso1 = WKPickerItem()
        queso1.title = "Mozzarela"
        queso1.caption = "Queso"
        let queso2 = WKPickerItem()
        queso2.title = "Cheddar"
        queso2.caption = "Queso"
        let queso3 = WKPickerItem()
        queso3.title = "Parmesano"
        queso3.caption = "Queso"
        let queso4 = WKPickerItem()
        queso4.title = "Sin queso"
        queso4.caption = "Queso"
        let quesosPicker = [queso1, queso2, queso3, queso4]
        
        pickerQuesos.setItems(quesosPicker)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Registro selección del queso
    @IBAction func seleccionaQueso(value: Int) {
        let quesoElegido : String = pizzaQueso.eligeQueso(value)
        pizzaQueso.queso = quesoElegido
        print("\(quesoElegido) \(value)")
    }
    
    // Acción del botón
    @IBAction func confirmaQueso() {
        pushControllerWithName("QuesoElegido", context: pizzaQueso)
        print("Siguiente elección con queso \(pizzaQueso.queso)")
    }
    
}
