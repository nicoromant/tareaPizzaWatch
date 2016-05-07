//
//  EligeMasa.swift
//  PizzaWatch
//
//  Created by Nicolas Roman Toro on 5/6/16.
//  Copyright © 2016 Nicolas Roman Toro. All rights reserved.
//

import WatchKit
import Foundation


class EligeMasa: WKInterfaceController {
    
    // Conecto label Tamaño para mostrar elección de pantalla anterior
    @IBOutlet var etiquetaTamaño: WKInterfaceLabel!
    
    // Defino outlet del Picker
    @IBOutlet var pickerMasas: WKInterfacePicker!
    
    // Defino variable Pizza
    var pizzaMasa : Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Actualizo label Tamaño con elección de pantalla anterior
        let c = context as! Pizza
        etiquetaTamaño.setText(c.tamaño)
        // Actualizo valor tamaño para pasarlo a siguiente pantalla
        pizzaMasa.tamaño = c.tamaño
        
        // Creo array de masas y seteo contenidos del picker
        let masa1 = WKPickerItem()
        masa1.title = "Delgada"
        masa1.caption = "Masa"
        let masa2 = WKPickerItem()
        masa2.title = "Gruesa"
        masa2.caption = "Masa"
        let masa3 = WKPickerItem()
        masa3.title = "Crujiente"
        masa3.caption = "Masa"
        let masasPicker = [masa1, masa2, masa3]
        
        pickerMasas.setItems(masasPicker)

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Registro selección de Masa del Picker
    @IBAction func seleccionaMasa(value: Int) {
        let masaElegida : String = pizzaMasa.eligeMasa(value)
        pizzaMasa.masa = masaElegida
        print("\(masaElegida) \(value)")
    }
    
    // Accion del botón
    @IBAction func confirmaMasa() {
        pushControllerWithName("MasaElegida", context: pizzaMasa)
        print("Siguiente elección con masa \(pizzaMasa.masa)")
    }
    
}
