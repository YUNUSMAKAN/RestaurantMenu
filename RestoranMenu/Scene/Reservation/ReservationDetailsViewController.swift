//
//  ReservationDetailsViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 10.11.2020.
//

import UIKit
import FSCalendar

class ReservationDetailsViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var calendarView: FSCalendar!
    
    var formatter = DateFormatter()
    var selectedDate = Date()
    var selectedPlace = ""
    var screnType : ReservationType = .preSelected
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.scope = .month
        
        calendarView.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendarView.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18.0) //November 2020 yazan kisim
        calendarView.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 19.0)
        
        calendarView.appearance.todayColor = .green
        calendarView.appearance.titleTodayColor = .white
        calendarView.appearance.titleDefaultColor = .blue
        calendarView.appearance.headerTitleColor = .red //Ayi ve yilin rengini belirler.
        calendarView.appearance.weekdayTextColor = .red //Hafta gunlerinin rengi.
        
        calendarView.allowsMultipleSelection = true //Birden fazla secim yapmaya izin.
        calendarView.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 15
        fetchData()
        
       
    }
    
    func fetchData(){
        if screnType == .preSelected {
            
            if let place = UserDefaults.standard.object(forKey: "place") as? String {
                
                if place == selectedPlace {
                    titleLabel.text = place
                    
                    if let name = UserDefaults.standard.object(forKey: "name") as? String {
                        nameLabel.text = name
                    }
                    if let surname = UserDefaults.standard.object(forKey: "surname") as? String {
                        surnameLabel.text = surname
                    }
                    
                    if let phone = UserDefaults.standard.object(forKey: "phone") as? String {
                        phoneLabel.text = phone
                    }
                    
                    if let date = UserDefaults.standard.object(forKey: "date") as? Date {
                        calendarView.select(date)
                    }
                }
            }
        }
    }
    
    //  MARK:DELEGATE-TARIH SECILINCE NE YAPACAGINI BURDA BELIRTIYORUZ.
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-YYYY" //tarih formatini belirledik.
        print("Date Selected = \(formatter.string(from: date))")
        selectedDate = date
        
    }
    
    //    MARK:DATASOURCE-HANGI TARIHTEN ITIBAREN TAKVIM AKTIF OLSUN BURDA ONU BELIRTIYORUZ.
        func minimumDate(for calendar: FSCalendar) -> Date {
            return Date() //Bu gunden itibaren olan tarihler gostericek gecmis tarihler degil.
        }
    
    //    MARK:DELEGATE-DOKUNARAK TARIH SECILMESINE IZIN VERILIP VERILMEDIGINI BELIRTIRIZ BURDA.
        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            formatter.dateFormat = "dd-MM-yyyy"
//            guard let excludedDate = formatter.date(from: "13-11-2020") else {return true} //Belirtilen tarih secilemez.
//            if date.compare(excludedDate) == .orderedSame {
//                return false
//            }
            return true
        }
}
