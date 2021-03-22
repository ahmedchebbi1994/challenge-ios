//
//  BanksListViewController.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit


final class BanksListViewController: BindableViewController<BanksListView, BanksListViewModel> {
    
    //MARK: -Property
    var dataResources: [ResourceViewModel] = []
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .corporateWhite
        title = "Banks"
        viewModel.fetchAllBanks { (data) in
            self.dataResources = data
            DispatchQueue.main.async {
                self.layout.tableView.reloadData()
            }
        }
    }
    
    
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    
    func bindViewModel() {
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
    }
 
}
extension BanksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResources[section].displayBanksCount
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataResources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mycell = tableView.dequeueReusableCell(withIdentifier: BankCell.identifier, for: indexPath) as? BankCell {
            let viewModel = dataResources[0]
            mycell.bind(to: viewModel)
            return mycell
        }
        return UITableViewCell()
    }
    
}
