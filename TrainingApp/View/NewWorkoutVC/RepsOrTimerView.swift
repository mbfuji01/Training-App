//
//  NewOrTimerView.swift
//  TrainingApp
//
//  Created by demasek on 22.10.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .robotoMedium22()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let chooseRepeatOrTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose repeat or timer"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .robotoMedium22()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium22()
        label.textColor = .specialGray
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialGreen
        slider.maximumTrackTintColor = .specialLightBrown
        slider.alpha = 0.5
        slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
//MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                       setsValueLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(setsStackView)
        addSubview(setsSlider)
        addSubview(chooseRepeatOrTimerLabel)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,
                                                       repsValueLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(repsStackView)
        addSubview(repsSlider)
        
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,
                                                       timerValueLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(timerStackView)
        addSubview(timerSlider)
    }
    
    @objc private func setsSliderChanged() {
        setsValueLabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc private func repsSliderChanged() {
        repsValueLabel.text = "\(Int(repsSlider.value))"

        setDeactive(label: timerLabel, valueLabel: timerValueLabel, slider: timerSlider)
        setActive(label: repsLabel, valueLabel: repsValueLabel, slider: repsSlider)
    }
    
    @objc private func timerSliderChanged() {
        
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)
        }(Int(timerSlider.value))
  
        timerValueLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
        
        setDeactive(label: repsLabel, valueLabel: repsValueLabel, slider: repsSlider)
        setActive(label: timerLabel, valueLabel: timerValueLabel, slider: timerSlider)
    }
    
    private func setActive(label: UILabel, valueLabel: UILabel, slider: UISlider) {
        label.alpha = 1
        valueLabel.alpha = 1
        slider.alpha = 1
    }
    
    private func setDeactive(label: UILabel, valueLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        valueLabel.alpha = 0.5
        valueLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
}

//MARK: - setConstraints

extension RepsOrTimerView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 5),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            chooseRepeatOrTimerLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 15),
            chooseRepeatOrTimerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: chooseRepeatOrTimerLabel.bottomAnchor, constant: 5),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 15),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 5),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
