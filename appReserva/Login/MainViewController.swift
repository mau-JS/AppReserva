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
    
    @IBAction func presionaInicarSesion(_ sender: Any) {
        let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "menuIniciarSesion") as! LoginViewController
        //Aquí configuramos como deseamos que se presente la pantalla
        myWebView.modalPresentationStyle = .fullScreen
        self.present(myWebView, animated: true, completion: nil)
    }
}
