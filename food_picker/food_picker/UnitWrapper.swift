//
//  UnitWrapper.swift
//  food_picker
//
//  Created by Actor on 2024/1/29.
//

@propertyWrapper
struct Unit {
    private var unit: String = "g"
    private var value: Double
    var wrappedValue: Double {
        get { value }
        set {
            value = newValue
        }
    }

    var projectedValue: String {
        "\(value.formatted()) \(unit)"
    }

    init(wrappedValue: Double, _ unit: String) {
        value = wrappedValue
        self.unit = unit
    }
}
