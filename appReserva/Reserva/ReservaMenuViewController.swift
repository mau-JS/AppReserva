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
            TileCollectionViewCellViewModel(name: "Reserva de Aulas", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Reserva de Materiales", backgroundColor: .systemPink),
            TileCollectionViewCellViewModel(name: "Reserva de Equipos", backgroundColor: .systemRed),
        ])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
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
        return view.frame.size.width/2
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
