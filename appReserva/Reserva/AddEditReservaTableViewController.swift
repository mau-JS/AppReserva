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
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBAction func textEditingChanged (_ sender: UITextField){
        
    }
    var reservas: Reservas?
    //Código para fechas
    let datePicker = UIDatePicker()
    let datePicker2 = UIDatePicker()
    //Termina Código de fechas
    
    init?(coder: NSCoder, reservas: Reservas?){
        self.reservas = reservas
        super.init(coder: coder)
    }
    //Aquí elegimos el contenido a guardar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else{return}
        let aula = aulaTextField.text!
        let tipo = tipoTextField.text ?? ""
        let description = "Esta es una descripción"
        let horarioI = horarioInicial.text ?? ""
        let horarioF = horarioFinal.text ?? ""
        reservas = Reservas(aula: aula, tipo: tipo, description: description, horarioInicio: horarioI, horarioFinal: horarioF)
    }
    //Aquí se agrega el contenido a guardar
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aquí almacenamos los datos en los text field
        if let reservas = reservas {
            aulaTextField.text = reservas.aula
            tipoTextField.text = reservas.tipo
            horarioInicial.text = reservas.horarioInicio
            horarioFinal.text = reservas.horarioFinal
            title = "Editar Reserva"
        }
        else{
            title = "Agregar Reserva"
        }
        createDatePicker()  //Función para fecha inicial
        createDatePicker2() //Función para fecha final

        
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
    
    //Terminan funciones de horario

    
}
