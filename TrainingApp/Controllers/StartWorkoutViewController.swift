//
//  StartWorkoutViewController.swift
//  TrainingApp
//
//  Created by demasek on 26.10.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "START WORKOUT"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sportsmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsmanImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.backgroundColor = .specialGreen
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()

    private let detailsView = DetailsView()
    
//MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportsmanImageView)
        view.addSubview(detailsLabel)
        view.addSubview(detailsView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeButtonTapped() {
        print("closeButtonTapped")
    }

    @objc private func finishButtonTapped() {
        print("finishButtonTapped")
    }
}

//MARK: - setConstraints

extension StartWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            sportsmanImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 20),
            sportsmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sportsmanImageView.widthAnchor.constraint(equalToConstant: 190),
            sportsmanImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: sportsmanImageView.bottomAnchor, constant: 5),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 0),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            detailsView.heightAnchor.constraint(equalToConstant: 240)
        ])
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            finishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
