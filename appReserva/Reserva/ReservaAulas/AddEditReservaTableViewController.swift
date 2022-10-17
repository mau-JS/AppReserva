//
//  AddEditReservaTableViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 27/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseAnalytics
import FirebaseFirestore
class AddEditReservaTableViewController: UITableViewController {
    var conteo = 0
    let aulas = ["A-101","A-102", "A103", "A-201", "A-202"]
    let laboratorios = ["CEDETEC 102","CEDETEC 103", "CEDETEC 202", "CEDETEC 203", "CEDETEC 203"]
    let cubiculos = ["CUB-102","CUB-201", "CUB-302", "CUB-301", "CUB-101"]
    let tipo = ["Selecciona el tipo...","Laboratorio","Salón", "Cubiculo"]
    
    var selectedItemsArray = [String]()
    //MARK: - Aquí declaramos los pickerview
    var lugarPickerView = UIPickerView()
    var tipoPickerView = UIPickerView()
    
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
    //MÁS IMPORTANTE
    //Esta función es donde vamos agregando los datos, al final creamos un objeto de tipo reservas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else{return}
        let db = Firestore.firestore()
        let id = Usuario.id
        let nombreRecurso = aulaTextField.text ?? ""
        let tipo = tipoTextField.text ?? ""
        let ubicacion = "Aulas I, 3er Piso"
        let horarioI = horarioInicial.text ?? ""
        let horarioF = horarioFinal.text ?? ""
        
        //Queries
       /* print(db.collection("users/" + String(Usuario.id) + "/reservas").whereField("first_name", isEqualTo: "May"))*/
        
        
        //Aquí enviamos la información a la base de datos desde los datos que agrega el usuario
        //Se crea un documento por reserva
        /*db.collection("users/" + String(Usuario.id) + "/reservas").addDocument(data: ["nombreRecurso" : nombreRecurso, "tipo": tipo,"descripción": ubicacion, "horarioI": horarioI, "horarioF": horarioF])*/
        
        //Una forma de agregar a la base de datos
        /*db.collection("users/" + String(Usuario.id) + "/reservas").document("reserva" + String(conteo)).setData(["nombreRecurso": nombreRecurso, "tipo": tipo, "descripción": ubicacion, "horarioI":horarioI, "horarioF": horarioF],merge:true)*/
        
        //Este objeto es que se imprime en el menú
        reservas = Reservas(id: id, nombreRecurso: nombreRecurso, tipo: tipo, ubicacion: ubicacion, horarioInicio: horarioI, horarioFinal: horarioF)
        
    }
    //Aquí se agrega el contenido a guardar
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(aulaTextField)
        //MARK: - Aquí también manipulamos pickerview
        lugarPickerView.delegate = self
        lugarPickerView.dataSource = self
        
        tipoPickerView.delegate = self
        tipoPickerView.dataSource = self
        
        
        tipoTextField.inputView = tipoPickerView
        tipoTextField.textAlignment = .center
        tipoTextField.inputAccessoryView = createToolbar()
        
        aulaTextField.inputView = lugarPickerView
        aulaTextField.textAlignment = .center
        aulaTextField.inputAccessoryView = createToolbar()
        
        
        
        
        
        //Aquí almacenamos los datos en los text field
        if let reservas = reservas {
            aulaTextField.text = reservas.nombreRecurso
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
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate =  Date(timeIntervalSinceNow: 0)
        horarioInicial.inputView = datePicker
        horarioInicial.inputAccessoryView = createToolbar()
        
    }
    func createDatePicker2(){
        
        datePicker2.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker2.datePickerMode = .dateAndTime
        datePicker2.minimumDate =  Date(timeIntervalSinceNow: 0)
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
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
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
        dateFormatter2.dateFormat = "yyyy-MM-dd HH:mm"
        self.horarioFinal.text = dateFormatter2.string(from: datePicker2.date)
        print(self.horarioFinal.text!)
        self.view.endEditing(true)
    }
    
    //Terminan funciones de horario

    
}
extension AddEditReservaTableViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == tipoPickerView{
            return tipo.count
        }
        else if pickerView == lugarPickerView{
            return selectedItemsArray.count
        }
        return 0
//        switch pickerView{
//        case lugarPickerView:
//            return lugares.count
//        case tipoPickerView:
//            return tipo.count
//        default:
//            return 0
//        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == tipoPickerView{
            return tipo[row]
        }
        else if pickerView == lugarPickerView{
            return selectedItemsArray[row]
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == tipoPickerView{
            switch row{
            case 1:
                selectedItemsArray = laboratorios
                tipoTextField.text = tipo[row]
            case 2:
                selectedItemsArray = aulas
                tipoTextField.text = tipo[row]
            case 3:
                selectedItemsArray = cubiculos
                tipoTextField.text = tipo[row]
            default:
                selectedItemsArray = []
            }
            lugarPickerView.reloadAllComponents()
        }
        else if pickerView == lugarPickerView{
            print(row)
            var item = selectedItemsArray[row]
                //tipoTextField.text = tipo[row]
            aulaTextField.text = ""
                aulaTextField.text = item
        }
//        if pickerView == lugarPickerView{
//            aulaTextField.text = lugares[row]
//            aulaTextField.resignFirstResponder()
//        }
//        if pickerView == tipoPickerView{
//            tipoTextField.text = tipo[row]
//            tipoTextField.resignFirstResponder()
//        }
    }
    
    
    
}
