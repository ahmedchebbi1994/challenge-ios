//
//  BanksListView.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

final class BanksListView: ReusableUIView {
    
    // MARK: - IBOutlet
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Install UI
    override func setupUI() {
        addSubview(tableView)
    }
    
    // MARK: - Constraints
    override func makeConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
        ])
    }
    
    // MARK: - configUI
    override func configUI() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        // register a defalut cell
        tableView.register(BankCell.self, forCellReuseIdentifier: BankCell.identifier)
    }
    
    // MARK: - Styling
    override func styleUI() {
        
    }
}
