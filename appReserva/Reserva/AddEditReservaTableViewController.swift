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
    let datePicker2 = UIDatePicker()
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
        createDatePicker()  //Función para fecha inicial
        createDatePicker2() //Función para fecha final
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
    func createToolbar2 () -> UIToolbar{
        //Creando Toolbar
        let toolbar2 = UIToolbar()
        //Dando tamaño para que ocupe toda la pantalla
        toolbar2.sizeToFit()
        //Botón de fin
        let doneBtn2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar2.setItems([doneBtn2], animated: true)
        return toolbar2
    }
    //Función para botón
    func createDatePicker(){
        
        datePicker.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker.datePickerMode = .date
        horarioInicial.inputView = datePicker
        horarioInicial.inputAccessoryView = createToolbar()
        
    }
    func createDatePicker2(){
        
        datePicker2.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker2.datePickerMode = .date
        horarioFinal.inputView = datePicker2
        horarioFinal.inputAccessoryView = createToolbar2()
        
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
    
    @objc func donePressed2(){
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .medium
        dateFormatter2.timeStyle = .none
        //Extraemos el texto de la fecha
        //self.birthdayField.text = "\(datePicker.date)"
        horarioFinal.textAlignment = .center
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        self.horarioFinal.text = dateFormatter2.string(from: datePicker2.date)
        print(self.horarioFinal.text!)
        self.view.endEditing(true)
    }
    
    
}
