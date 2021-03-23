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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func bindViewModel() {
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
        title = "Banks"
    }
    
    private func loadData(){
        layout.equip(with: [.disableUserInteraction,.activityIndicator])
        viewModel.fetchAllBanks { (data) in
            
            self.dataResources = data
            //Check if Current region "resource" exist
            let currentRegionResource = (data.filter { $0.displayCountryCode == Wording.currentRegion }).first
            if let currentRegionResource = currentRegionResource {
                self.dataResources.removeAll { $0.displayCountryCode ==  Wording.currentRegion}
                self.dataResources.insert(currentRegionResource, at: 0)
            }
            self.reloadTableView()
        }
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.layout.unEquip()
            self.layout.tableView.reloadData()
        }
    }
 
}
extension BanksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResources[section].displayBanksCount
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataResources.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataResources[section].displayCountryName 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mycell = tableView.dequeueReusableCell(withIdentifier: BankCell.identifier, for: indexPath) as? BankCell {
            let viewModel = dataResources[indexPath.section].displayBanks[indexPath.row]
            mycell.bind(to: viewModel)
            return mycell
        }
        return UITableViewCell()
    }
    
}
