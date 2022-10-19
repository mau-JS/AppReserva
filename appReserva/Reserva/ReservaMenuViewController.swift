//
//  ReservaMenuViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 18/10/22.
//

import UIKit

class ReservaMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        //Vector de todo lo que aparece
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(name: "Reserva de Aulas", backgroundColor: UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)),
            TileCollectionViewCellViewModel(name: "Reserva de Materiales", backgroundColor: UIColor.init(red: 180/255, green: 180/255, blue: 180/255, alpha: 0.5)),
            TileCollectionViewCellViewModel(name: "Reserva de Equipos", backgroundColor: UIColor.init(red: 86/255, green: 44/255, blue: 168/255, alpha: 0.5)),
        ])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
           label.center = CGPoint(x: 195, y: 75)
        label.textAlignment = .left
           label.text = "Tipo de Reserva"
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
        tableView.dataSource = self
        tableView.delegate = self
        label.font = UIFont.boldSystemFont(ofSize: 27)
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else{
            fatalError()
        }
        cell.delegatee = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/1.1
    }

}

extension ReservaMenuViewController: CollectionTableViewCellDelegate{
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        switch viewModel.name{
        case "Reserva de Aulas":
            self.performSegue(withIdentifier: "ReservaAulaSegue", sender: nil)
        case "Reserva de Equipos":
            self.performSegue(withIdentifier: "ReservaEquipoSegue", sender: nil)
        case "Reserva de Materiales":
            self.performSegue(withIdentifier: "ReservaMaterialSegue", sender: nil)
        default:
            print("Hola")
        }
    }
}
