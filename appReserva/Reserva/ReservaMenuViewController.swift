//
//  ReservaMenuViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 18/10/22.
//

import UIKit

class ReservaMenuViewController: UIViewController, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        //Vector de todo lo que aparece
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemPink),
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemRed),
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemCyan)
        ])
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
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
        cell.configure(with: viewModel)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
