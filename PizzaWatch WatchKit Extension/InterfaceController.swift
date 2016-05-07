//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Nicolas Roman Toro on 5/5/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // Defino outlet del Picker
    @IBOutlet var pickerTamaño: WKInterfacePicker!
    
    // Defino variable Pizza
    var pizzaTamaño : Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Creo array de tamaños y seteo contenidos del picker
        let tamaño1 = WKPickerItem()
        tamaño1.title = "Chica"
        tamaño1.caption = "Tamaño"
        let tamaño2 = WKPickerItem()
        tamaño2.title = "Mediana"
        tamaño2.caption = "Tamaño"
        let tamaño3 = WKPickerItem()
        tamaño3.title = "Grande"
        tamaño3.caption = "Tamaño"
        let tamañosPicker = [tamaño1, tamaño2, tamaño3]

        pickerTamaño.setItems(tamañosPicker)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Registro selección de Tamaño del Picker
    @IBAction func seleccionaTamaño(value: Int) {
        let tamañoElegido : String = pizzaTamaño.eligeTamaño(value)
        pizzaTamaño.tamaño = tamañoElegido
        print("\(tamañoElegido) \(value)")
    }
    
    // Acción del botón
    @IBAction func confirmaTamaño() {
        pushControllerWithName("TamañoElegido", context: pizzaTamaño)
        print("Siguiente elección con tamaño \(pizzaTamaño.tamaño)")
    }
    
}
