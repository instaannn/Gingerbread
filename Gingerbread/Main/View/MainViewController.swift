//
//  MainViewController.swift
//  Gingerbread
//
//  Created by Анна Сычева on 28.09.2020.
//  Copyright © 2020 Анна Сычева. All rights reserved.
//

import UIKit

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: Public properties
    
    var presenter: IMainPresenter?
    
    // MARK: Private properties
    
    private lazy var collectionView = UICollectionView()
    private lazy var stateView = UIView()
    
    private lazy var dataView = [String]()
    
    private lazy var textLabelHZ = UILabel()
    
    private lazy var textLabelPicture = UILabel()
    private lazy var imagePicture = UIImageView()
    
    private lazy var tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBinding()
    }
    
    // MARK: - Public methods
    
    func succes() {
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    func failure() {
        DispatchQueue.main.async {
            self.presentAlert(withTitle: Constants.withTitle, message: Constants.message)
        }
    }
}

// MARK: - IMainViewController

extension MainViewController: IMainViewController {
    
    func getViews(dataViews: [String]) {
        dataView = dataViews
    }
    
    func getHZ(text: String) {
        textLabelHZ.text = text
    }
    
    func getPicture(text: String, nameImage: String) {
        guard let url = URL(string: nameImage) else { return }
        textLabelPicture.text = text
        imagePicture.load(url: url)
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataView.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifierCell,
                                                      for: indexPath) as! MainCollectionViewCell
        
        let data = dataView[indexPath.row]
        cell.backgroundColor = .systemPink
        cell.setupDataCell(data: data)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        enum DataName {
            static var hz = Constants.hz
            static var picture = Constants.picture
            static var selector = Constants.selector
        }
        
        switch dataView[indexPath.row] {
        case DataName.hz:
            textLabelHZ.isHidden = false
            textLabelPicture.isHidden = true
            imagePicture.isHidden = true
            tableView.isHidden = true
            stateView.backgroundColor = .systemIndigo
        case DataName.picture:
            textLabelHZ.isHidden = true
            textLabelPicture.isHidden = false
            imagePicture.isHidden = false
            tableView.isHidden = true
            stateView.backgroundColor = .systemOrange
        case DataName.selector:
            textLabelHZ.isHidden = true
            textLabelPicture.isHidden = true
            imagePicture.isHidden = true
            tableView.isHidden = false
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = Constants.four
        let paddingWith = Constants.twenty * (itemPerRow + Constants.one)
        let availableWith = collectionView.frame.width - paddingWith
        let widthPetItem = availableWith / itemPerRow
        return CGSize(width: widthPetItem, height: widthPetItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.twenty,
                            left: Constants.twenty,
                            bottom: Constants.twenty,
                            right: Constants.twenty)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.twenty
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.twenty
    }
    
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.variants?.count ?? Constants.zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifierCell,
            for: indexPath) as! MainTableViewCell
        
        let variant = presenter?.variants?[indexPath.row]
        cell.setupDataCell(id: variant?.id, text: variant?.text)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
}

// MARK: - Setup

private extension MainViewController {
    
    func setupView() {
        setupCollectionView()
        
        addViews()
        
        setupStateView()
        setupTextLabel()
        setupTextLabelPicture()
        setupTableView()
        defaultStateView()
        
        layout()
    }
    
    func setupBinding() {
        presenter?.fetchData()
    }
}

// MARK: - Setups View

private extension MainViewController {
    
    func addViews() {
        view.addSubview(collectionView)
        view.addSubview(stateView)
        
        stateView.addSubview(textLabelHZ)
        
        stateView.addSubview(textLabelPicture)
        stateView.addSubview(imagePicture)
        
        stateView.addSubview(tableView)
    }
    
    func defaultStateView() {
        textLabelHZ.isHidden = true
        textLabelPicture.isHidden = true
        imagePicture.isHidden = true
        tableView.isHidden = true
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: Constants.identifierCell)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    
    func setupStateView() {
        stateView.backgroundColor = .white
    }
    
    func setupTextLabel() {
        textLabelHZ.textAlignment = .center
        textLabelHZ.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        textLabelHZ.textColor = .white
    }
    
    func setupTextLabelPicture() {
        textLabelPicture.textAlignment = .center
        textLabelPicture.font = UIFont.italicSystemFont(ofSize: Constants.fontSize)
        textLabelPicture.textColor = .white
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.identifierCell)
    }
}

// MARK: - Layout

private extension MainViewController {
    
    func layout() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.zeroAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.zeroAnchor),
            collectionView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.zeroAnchor),
            collectionView.heightAnchor.constraint(
                equalToConstant: view.frame.height / Constants.collectionViewHeightAnchor)])
        
        stateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stateView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.zeroAnchor),
            stateView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.zeroAnchor),
            stateView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.zeroAnchor),
            stateView.bottomAnchor.constraint(
                equalTo: collectionView.topAnchor,
                constant: Constants.zeroAnchor)])
        
        textLabelHZ.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabelHZ.centerYAnchor.constraint(
                equalTo: stateView.centerYAnchor),
            textLabelHZ.leadingAnchor.constraint(
                equalTo: stateView.leadingAnchor,
                constant: Constants.zeroAnchor),
            textLabelHZ.trailingAnchor.constraint(
                equalTo: stateView.trailingAnchor,
                constant: Constants.zeroAnchor)])
        
        textLabelPicture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabelPicture.topAnchor.constraint(
                equalTo: stateView.topAnchor,
                constant: Constants.textLabelPictureTopAnchor),
            textLabelPicture.leadingAnchor.constraint(
                equalTo: stateView.leadingAnchor,
                constant: Constants.zeroAnchor),
            textLabelPicture.trailingAnchor.constraint(
                equalTo: stateView.trailingAnchor,
                constant: Constants.zeroAnchor)])
        
        imagePicture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imagePicture.topAnchor.constraint(
                equalTo: textLabelPicture.topAnchor,
                constant: Constants.imagePictureTopAnchor),
            imagePicture.centerXAnchor.constraint(
                equalTo: stateView.centerXAnchor),
            imagePicture.widthAnchor.constraint(
                equalToConstant: Constants.sizePicture),
            imagePicture.heightAnchor.constraint(
                equalToConstant: Constants.sizePicture)])
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: stateView.topAnchor,
                constant: Constants.zeroAnchor),
            tableView.leadingAnchor.constraint(
                equalTo: stateView.leadingAnchor,
                constant: Constants.zeroAnchor),
            tableView.trailingAnchor.constraint(
                equalTo: stateView.trailingAnchor,
                constant: Constants.zeroAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: stateView.bottomAnchor,
                constant: Constants.zeroAnchor)])
    }
}

// MARK: - Constants

private extension MainViewController {
    
    enum Constants {
        static let identifierCell: String = "Cell"
        static let zeroAnchor: CGFloat = 0
        static let sizePicture: CGFloat = 200
        static let imagePictureTopAnchor: CGFloat = 50
        static let textLabelPictureTopAnchor: CGFloat = 50
        static let collectionViewHeightAnchor: CGFloat = 6
        static let fontSize: CGFloat = 20
        static let hz: String = "hz"
        static let picture: String = "picture"
        static let selector: String = "selector"
        static let message: String = "Повторите запрос"
        static let withTitle: String = "Ошибка"
        static let twenty: CGFloat = 20
        static let four: CGFloat = 4
        static let zero: Int = 0
        static let one: CGFloat = 1
    }
    
}
