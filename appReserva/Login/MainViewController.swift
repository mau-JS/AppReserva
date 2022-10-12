//
//  MainViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var botonRegistro: UIButton!
    @IBOutlet var botonIniciarSesion: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(botonRegistro)
        Utilities.styleHollowButton(botonIniciarSesion)
    }
    

}
