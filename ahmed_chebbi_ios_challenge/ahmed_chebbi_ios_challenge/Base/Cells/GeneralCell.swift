//
//  GeneralCell.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

class GeneralCell: UITableViewCell {

    static let padding: CGFloat = 5.0
    
    // MARK: - IOutlet
    private(set) lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
        
    
    private(set) lazy var firstTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .corporateBlack
        label.numberOfLines = 0
        return label
    }()
    
 
    private(set) lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .corporateBlack
        label.text = "TEST3"
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private(set) lazy var stackViewName: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 5
        return st
    }()
    
    private(set) lazy var profileView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    private(set) lazy var profileIMGView: UIImageView = {
        
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    
    var profileConstraintWidth: NSLayoutConstraint?
    var profileConstraintHeight: NSLayoutConstraint?
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        makeConstraints()
        configUI()
        styleUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
 
    }
    
    func updateDistributionStackLabels( distribution : UIStackView.Distribution){
        stackViewName.distribution = distribution
    }

    // MARK: - Constraints
    func makeConstraints() {
        NSLayoutConstraint.activate([

            profileIMGView.leadingAnchor.constraint(equalTo: self.profileView.leadingAnchor, constant: 2),
            profileIMGView.topAnchor.constraint(equalTo: self.profileView.topAnchor, constant: 2),
            profileIMGView.trailingAnchor.constraint(equalTo: self.profileView.trailingAnchor, constant: -2),
            profileIMGView.bottomAnchor.constraint(equalTo: self.profileView.bottomAnchor, constant: -2),
            
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Self.padding),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Self.padding),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Self.padding),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -Self.padding),
            
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: Self.padding),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: Self.padding),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -Self.padding),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -Self.padding),
            
        ])
        
        profileConstraintHeight = profileView.heightAnchor.constraint(equalToConstant: 80)
        profileConstraintWidth = profileView.widthAnchor.constraint(equalToConstant: 80)
        
        profileConstraintWidth?.isActive = true
        profileConstraintHeight?.isActive = true
    }
    
    
    // MARK: - configUI
    func configUI() {
        mainView.layer.cornerRadius = 10
        mainView.backgroundColor = UIColor.corporateWhite.withAlphaComponent(0.1)
        selectionStyle = .none
    }
    
    // MARK: - Styling
    func styleUI() {
        backgroundColor = .corporateWhite
        mainView.layer.shadowColor = UIColor.darkGray.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = CGSize.zero
        mainView.layer.shadowRadius = 1
    }
    
    // MARK: - Install UI
    func setupUI() {
        stackViewName.addArrangedSubview(firstTitle)
        stackViewName.addArrangedSubview(thirdLabel)

        profileView.addSubview(profileIMGView)
        
        mainStackView.addArrangedSubview(profileView)
        mainStackView.addArrangedSubview(stackViewName)
        
        mainView.addSubview(mainStackView)
        
        contentView.addSubview(mainView)
    }
}
