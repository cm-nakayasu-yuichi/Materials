//
//  ViewController.swift
//  Materials
//
//  Created by nakayasu.yuichi on 2017/11/17.
//  Copyright © 2017年 cm-pliser. All rights reserved.
//

import UIKit

import UIKit



extension Date {
    
    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        self.init()
        if let v = year   { self.year = v }
        if let v = month  { self.month = v }
        if let v = day    { self.day = v }
        if let v = hour   { self.hour = v }
        if let v = minute { self.minute = v }
        if let v = second { self.second = v }
    }
    
    var year: Int {
        get {
            return componentValue(for: .year)
        }
        set {
            return setComponentValue(newValue, for: .year)
        }
    }
    
    var month: Int {
        get {
            return componentValue(for: .month)
        }
        set {
            setComponentValue(newValue, for: .month)
        }
    }
    
    var day: Int {
        get {
            return componentValue(for: .day)
        }
        set {
            setComponentValue(newValue, for: .day)
        }
    }
    
    var hour: Int {
        get {
            return componentValue(for: .hour)
        }
        set {
            return setComponentValue(newValue, for: .hour)
        }
    }
    
    var minute: Int {
        get {
            return componentValue(for: .minute)
        }
        set {
            setComponentValue(newValue, for: .minute)
        }
    }
    
    var second: Int {
        get {
            return componentValue(for: .second)
        }
        set {
            setComponentValue(newValue, for: .second)
        }
    }
    
    private func componentValue(for component: Calendar.Component) -> Int {
        return calendar.component(component, from: self)
    }
    
    private mutating func setComponentValue(_ value: Int, for component: Calendar.Component) {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.setValue(value, for: component)
        if let date = calendar.date(from: components) {
            self = date
        }
    }
    
    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .japan
        calendar.locale   = .japan
        return calendar
    }
}

extension TimeZone {
    
    static let japan = TimeZone(identifier: "Asia/Tokyo")!
}

extension Locale {
    
    static let japan = Locale(identifier: "ja_JP")
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 時刻は0時0分0秒にして、日付はそのままで、年を2010にしたい
        var date = Date(year: 2010, hour: 0, minute: 0, second: 0)
        print(date.year, date.month, date.day, date.hour, date.minute, date.second)
        date.month = 0
        
        print(date.year, date.month, date.day, date.hour, date.minute, date.second)
        
//        var date = Date(year: 1992, day: 17, hour: 4, minute: 5, second: 32)
//
//        print(date.year, date.month, date.day, date.hour, date.minute, date.second)
//
//        date.year = 2014
//        date.month = 4
//        date.day = 0
//        date.hour = 23
//        date.minute = 59
//        date.second = 59
//
//        print(date.year, date.month, date.day, date.hour, date.minute, date.second)
    }
}
