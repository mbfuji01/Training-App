//
//  WeatherView.swift
//  TrainingApp
//
//  Created by demasek on 18.10.2022.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLabelDescription: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.font = .robotoMedium14()
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "weatherIcon") 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        self.addShadowOnView()
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherLabel)
        addSubview(weatherLabelDescription)
        addSubview(weatherIcon)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.bottomAnchor.constraint(equalTo: weatherLabelDescription.topAnchor, constant: -5),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherIcon.leadingAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            weatherLabelDescription.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            weatherLabelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabelDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            weatherLabelDescription.trailingAnchor.constraint(equalTo: weatherIcon.leadingAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherIcon.widthAnchor.constraint(equalToConstant: 60),
            weatherIcon.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
