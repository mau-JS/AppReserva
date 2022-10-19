//
//  SalidaViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 19/10/22.
//

import UIKit

class SalidaViewController: UIViewController {
    @IBOutlet var botonCerrarSesion: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(botonCerrarSesion)
        self.performSegue(withIdentifier: "cerrarSesion", sender: nil)
    }
    
}
