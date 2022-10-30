//
//  WorkoutModel.swift
//  TrainingApp
//
//  Created by demasek on 29.10.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    
    @Persisted var workoutName: String = "Unknown"
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
}
