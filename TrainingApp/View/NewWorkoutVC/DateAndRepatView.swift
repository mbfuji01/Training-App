//
//  DateAndRepatView.swift
//  TrainingApp
//
//  Created by demasek on 21.10.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.isOn = true
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
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
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = .specialBrown
        
        addSubview(dateLabel)
        addSubview(repeatLabel)
        addSubview(datePicker)
        addSubview(repeatSwitch)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            repeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            repeatSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            repeatSwitch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
