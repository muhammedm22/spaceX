//
//  RocketDetailsViewController.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 14/02/2023.
//

import UIKit
import Combine
import SDWebImage

class RocketDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var detailsContainerView: UIView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readmoreBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var detailsTextView: UITextView!
    private var rocket: Launches?
    private var viewModel: RocketDetailsViewModel?
    private var bag = Set<AnyCancellable>()

    func set(rocket: Launches) {
        self.rocket = rocket
        viewModel = RocketDetailsViewModel(rocketId: rocket.id ?? "")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
        setObserver()
    }
    
    private func setUI() {
        setFonts()
        setDetailsContainerView()
        setReadMoreBtn()
    }
    
    private func setFonts() {
        titleLabel.font = UIFont.getFont(family: .bold(size: 20))
        numberLabel.font = UIFont.getFont(family: .bold(size: 22))
        dateLabel.font = UIFont.getFont(family: .regular(size: 19))
        detailsLabel.font = UIFont.getFont(family: .regular(size: 18))
        readmoreBtn.titleLabel?.font = UIFont.getFont(family: .regular(size: 18))
        shareBtn.titleLabel?.font = UIFont.getFont(family: .regular(size: 18))
    }
    
    private func setDetailsContainerView() {
        detailsContainerView.layer.cornerRadius = 30
    }
    private func setReadMoreBtn() {
        readmoreBtn.layer.cornerRadius = 6
    }
    private func setObserver() {
        viewModel?.$rocketData.sink(receiveValue: { [weak self] rocket in
            self?.titleLabel.text = rocket?.name
            let detailsText = " \(rocket?.description ?? "") \n \(rocket?.links?.wikipedia ?? "") "
            self?.detailsTextView.text = detailsText
            self?.rocketImage.sd_setImage(with: URL(string: rocket?.links?.patch?.large ?? ""))
        }).store(in: &bag)
        
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
