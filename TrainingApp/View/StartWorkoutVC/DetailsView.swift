//
//  DetailView.swift
//  TrainingApp
//
//  Created by demasek on 26.10.2022.
//

import UIKit

class DetailsView: UIView {
    
    private let bicepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1/4"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.titleLabel?.font = .robotoMedium18()
        button.tintColor = #colorLiteral(red: 0.7254901961, green: 0.7058823529, blue: 0.6392156863, alpha: 1)
        button.setImage(UIImage(named: "editingIcon"), for: .normal)
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.layer.cornerRadius = 10
        button.tintColor = .specialGray
        button.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.7058823529, blue: 0.02352941176, alpha: 1)
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    
//MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bicepsLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                      setsValueLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(setsStackView)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,
                                                      repsValueLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(repsStackView)
        addSubview(editingButton)
        addSubview(nextSetButton)
        
    }
    
    @objc private func editingButtonTapped() {
        
    }
    
    @objc private func nextSetButtonTapped() {
        
    }
}

//MARK: - setConstraints

extension DetailsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bicepsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            bicepsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: bicepsLabel.bottomAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 25),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 15),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            nextSetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            nextSetButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
