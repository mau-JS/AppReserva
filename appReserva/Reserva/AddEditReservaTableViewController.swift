//
//  AddEditReservaTableViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 27/09/22.
//

import UIKit

class AddEditReservaTableViewController: UITableViewController {
    @IBOutlet var aulaTextField: UITextField!
    @IBOutlet var tipoTextField: UITextField!
    var reservas: Reservas?
    
    init?(coder: NSCoder, reservas: Reservas?){
        self.reservas = reservas
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let reservas = reservas {
            aulaTextField.text = reservas.aula
            tipoTextField.text = reservas.tipo
        }
        else{
            title = "Agregar Reserva"
        }
    }
    
    
}
