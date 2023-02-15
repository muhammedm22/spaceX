//
//  LaunchesCollectionViewCell.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 11/02/2023.
//

import UIKit

class LaunchesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setContainerView()
        setFonts()
    }
    private func setContainerView() {
        self.layer.cornerRadius = 8
    }
    private func setFonts() {
        numberLabel.font = UIFont.getFont(family: .bold(size: 20))
        dateLabel.font = UIFont.getFont(family: .bold(size: 14))
        nameLabel.font = UIFont.getFont(family: .bold(size: 15))
    }
    
    func config(launch: Launches) {
        numberLabel.text = "\(launch.flight_number ?? 0)"
        nameLabel.text = launch.name
        dateLabel.text = launch.date_local
    }
}
