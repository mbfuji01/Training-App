//
//  CalendarView.swift
//  TrainingApp
//
//  Created by demasek on 18.10.2022.
//

import UIKit

class CalendarView: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
//MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func weekAray() -> [[String]] {
        
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "en_GB")
        dateFormater.dateFormat = "EEEEEE"
        
        var weekArray : [[String]] = [[],[]]
        let calendar = Calendar.current
        let today = Date()
        
        for i in -6...0 {
            let date = calendar.date(byAdding: .weekday, value: i, to: today)
            guard let date = date else { return weekArray }
            let components = calendar.dateComponents([.day], from: date)
            weekArray[1].append(String(components.day ?? 0))
            let weekDay = dateFormater.string(from: date)
            weekArray[0].append(String(weekDay))
        }
        return weekArray
    }
}

//MARK: - UICollectionViewDataSource

extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        
        cell.cellConfigure(weekAray: weekAray(), indexPath: indexPath)
        
        if indexPath.item == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionViewTapped")
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}

//MARK: - setConstraints

extension CalendarView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
