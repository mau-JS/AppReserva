//
//  AddEditReservaMaterialViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 12/10/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseAnalytics
import FirebaseFirestore
class AddEditReservaMaterialViewController: UITableViewController {
    
    
    var conteo = 0

    //MARK: - Aquí declaramos los pickerview
    @IBOutlet var aulaTextField: UITextField!
    @IBOutlet var horarioInicial: UITextField!
    @IBOutlet var horarioFinal: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBAction func textEditingChanged (_ sender: UITextField){
    }
    
    let equipos = ["Elige Material...","Licencia Matlab","Licencia AutoCAD,LicenciaPhotoshop"]
    var equipoPickerView = UIPickerView()
    
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
        let tipo = "Material"
        let ubicacion = "N/A"
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
        aulaTextField.inputAccessoryView =  createToolbar()
        equipoPickerView.delegate = self
        equipoPickerView.dataSource = self
        aulaTextField.inputView = equipoPickerView
        aulaTextField.textAlignment = .center
        //Aquí almacenamos los datos en los text field
        if let reservas = reservas {
            aulaTextField.text = reservas.nombreRecurso
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
        datePicker.minimumDate =  Date(timeIntervalSinceNow: 0)
        horarioInicial.inputView = datePicker
        horarioInicial.inputAccessoryView = createToolbar()
        
    }
    func createDatePicker2(){
        
        datePicker2.preferredDatePickerStyle = .wheels // Darle formato de wheels a la fecha
        datePicker2.datePickerMode = .date
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
extension AddEditReservaMaterialViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return equipos.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row{
        case 0:
            return ""
        case 1,2:
            return equipos[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0{
            aulaTextField.text = equipos[row]
        }
        else{
            aulaTextField.text = ""
        }
    }
    
}
