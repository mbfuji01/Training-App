//
//  TableViewCell.swift
//  TrainingApp
//
//  Created by demasek on 20.10.2022.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "trainingIconImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let trainingNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotoMedium22()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps: 10"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets: 2"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.addShadowOnView()
        button.layer.cornerRadius = 10
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .specialDarkGreen
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setContstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        backgroundColor = .clear
        selectionStyle = .none

        addSubview(backgroundCell)
        addSubview(iconImageView)
        addSubview(iconImage)
        addSubview(trainingNameLabel)
        addSubview(repsCountLabel)
        addSubview(setsCountLabel)
        contentView.addSubview(startButton)
    }
    
    @objc private func startButtonTapped() {
        print("startButtonTapped")
    }
    
    func cellConfigure(model: WorkoutModel) {
        
        trainingNameLabel.text = model.workoutName
        
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60) }(model.workoutTimer)
        
        repsCountLabel.text = (model.workoutTimer == 0 ? "Reps: \(model.workoutReps)" : "Timer: \(min) min \(sec) sec")
        setsCountLabel.text = ("Sets : \(model.workoutSets)")
        
        guard let imageData = model.workoutImage else { return }
        guard let image = UIImage(data: imageData) else { return }
        iconImage.image = image 
    }

    private func setContstraints() {

        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 75)
        ])
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 10),
            iconImage.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 10),
            iconImage.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -10),
            iconImage.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            trainingNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            trainingNameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            repsCountLabel.topAnchor.constraint(equalTo: trainingNameLabel.bottomAnchor, constant: 0),
            repsCountLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            repsCountLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            setsCountLabel.topAnchor.constraint(equalTo: trainingNameLabel.bottomAnchor, constant: 0),
            setsCountLabel.leadingAnchor.constraint(equalTo: repsCountLabel.trailingAnchor, constant: 10),
            setsCountLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: repsCountLabel.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            startButton.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
        ])
    }
}
