//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 10/02/2023.
//

import UIKit
import Combine
    
class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bigLuanchTitleLabel: UILabel!
    @IBOutlet weak var goldContainer: UIView!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var cardViewContainer: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var spaceShipsLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cornerImageContainer: UIView!
    @IBOutlet weak var cornerImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    private var viewModel: HomeViewModel?
    private var bag = Set<AnyCancellable>()
    private weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setLaunchesObserver()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setUI() {
        setCollectionView()
        setCardView()
        setUserImage()
        setFonts()
        setGoldContainer()
    }
    private func setFonts() {
        screenTitleLabel.font = UIFont.getFont(family: .bold(size: 16))
        bigLuanchTitleLabel.font = UIFont.getFont(family: .bold(size: 27))
        goldLabel.font = UIFont.getFont(family: .bold(size: 11))
        spaceShipsLabel.font = UIFont.getFont(family: .bold(size: 11))
        engineerLabel.font =  UIFont.getFont(family: .regular(size: 12))
        subTitleLabel.font = UIFont.getFont(family: .bold(size: 18))
        yearLabel.font = UIFont.getFont(family: .bold(size: 20))
        dateLabel.font = UIFont.getFont(family: .bold(size: 12))
        descLabel.font = UIFont.getFont(family: .regular(size: 14))
    }
    private func setCollectionView() {
        collectionView.register(UINib(nibName: "\(LaunchesCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "LaunchesCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setGoldContainer() {
        goldContainer.layer.cornerRadius = 12
    }
    private func setCardView() {
        cardViewContainer.layer.cornerRadius = 8
        cardView.layer.cornerRadius = 8
        cardImage.layer.cornerRadius = 8
    }
    private func setUserImage() {
        cornerImageContainer.layer.cornerRadius = 30
        cornerImage.layer.cornerRadius = 22
    }
    
    private func setLaunchesObserver() {
        viewModel?.$launches.sink(receiveCompletion: { _ in
        }, receiveValue: { [weak self] launches in
            self?.collectionView.reloadData()
        }).store(in: &bag)
    }
    func setViewModel(coordinator: HomeCoordinator) {
        self.viewModel = HomeViewModel(coordinator: coordinator)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LaunchesCollectionViewCell", for: indexPath) as? LaunchesCollectionViewCell
        if let launch = viewModel?.launches[indexPath.row] {
            cell?.config(launch: launch)
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.launches.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel?.didSelectRocket(index: indexPath.row)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width * 0.5
        return CGSize(width: width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

