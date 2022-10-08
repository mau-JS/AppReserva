//
//  MainViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var PopUp: UIButton!
    @IBOutlet var botonRegistro: UIButton!
    @IBOutlet var botonIniciarSesion: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUp.isHidden = true
        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(botonRegistro)
        Utilities.styleHollowButton(botonIniciarSesion)
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        // Creando alerta
                let alert = UIAlertController(title: "Notice", message: "Lauching this missile will destroy the entire universe. Is this what you intended to do?", preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Remind Me Tomorrow", style: UIAlertAction.Style.default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Launch the Missile", style: UIAlertAction.Style.destructive, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
    }
    

