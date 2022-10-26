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
//        label.text =
//        label.textColor =
//        label.font =
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
//        label.text =
//        label.textColor =
//        label.font =
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
//        button.titleLabel?.font =
//        button.backgroundColor =
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()
    
    private let detailsView = DetailsView()
    
//MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
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
        
        ])
    }
}
