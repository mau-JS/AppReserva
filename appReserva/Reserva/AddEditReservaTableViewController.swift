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
    @IBOutlet var horarioInicial: UITextField!
    @IBOutlet var horarioFinal: UITextField!
    var reservas: Reservas?
    
    //Código para fechas
    let datePicker = UIDatePicker()
    
    //Termina Código de fechas
    
    init?(coder: NSCoder, reservas: Reservas?){
        self.reservas = reservas
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()  //Función para fecha
        if let reservas = reservas {
            aulaTextField.text = reservas.aula
            tipoTextField.text = reservas.tipo
        }
        else{
            title = "Agregar Reserva"
        }
    }
    //Código para botón de fecha
    func createToolbar () -> UIToolbar{
        //Creando Toolbar
        let toolbar = UIToolbar()
        //Dando tamaño para que ocupe toda la pantalla
        toolbar.sizeToFit()
        //Botón de fin
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    //Función para botón
    func createDatePicker(){
        
        datePicker.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker.datePickerMode = .date
        horarioInicial.inputView = datePicker
        horarioInicial.inputAccessoryView = createToolbar()
        
    }
    
    //Función botón 1
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //Extraemos el texto de la fecha
        //self.birthdayField.text = "\(datePicker.date)"
        horarioInicial.textAlignment = .center
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.horarioInicial.text = dateFormatter.string(from: datePicker.date)
        print(self.horarioInicial.text!)
        self.view.endEditing(true)
    }
    
    
}
