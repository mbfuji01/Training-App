//
//  ChooseTrainingImageCell.swift
//  TrainingApp
//
//  Created by demasek on 30.10.2022.
//

import UIKit

class ChooseTrainingImageCell: UICollectionViewCell {
    
    private let trainingBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trainingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "trainingIconImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false 
        return imageView
    }()
    
//    override var isSelected: Bool {
//        didSet {
//            if self.isSelected {
//
//            } else {
//
//            }
//        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(trainingBackgroundImageView)
        addSubview(trainingImageView)
    }
    
    func cellConfigure() {
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            trainingBackgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            trainingBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trainingBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trainingBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            trainingImageView.topAnchor.constraint(equalTo: trainingBackgroundImageView.topAnchor, constant: 5),
            trainingImageView.leadingAnchor.constraint(equalTo: trainingBackgroundImageView.leadingAnchor, constant: 5),
            trainingImageView.trailingAnchor.constraint(equalTo: trainingBackgroundImageView.trailingAnchor, constant: -5),
            trainingImageView.bottomAnchor.constraint(equalTo: trainingBackgroundImageView.bottomAnchor, constant: -5)
        ])
    }
}
