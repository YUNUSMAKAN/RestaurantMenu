//
//  ReservationViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 10.11.2020.
//

import UIKit
import FSCalendar




class ReservationViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var reservationSaveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnametextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    //fileprivate weak var calendar: FSCalendar!
    
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
        reservationSaveButton.layer.cornerRadius = 20
        
//        if screnType == .preSelected {
//
//            if let place = UserDefaults.standard.object(forKey: "place") as? String {
//
//                if place == selectedPlace {
//                    titleLabel.text = place
//
//                    if let name = UserDefaults.standard.object(forKey: "name") as? String {
//                        nameTextField.text = name
//                    }
//                    if let surname = UserDefaults.standard.object(forKey: "surname") as? String {
//                        surnametextField.text = surname
//                    }
//
//                    if let phone = UserDefaults.standard.object(forKey: "phone") as? String {
//                        phoneTextField.text = phone
//                    }
//
//                    if let date = UserDefaults.standard.object(forKey: "date") as? Date {
//                        calendarView.select(date)
//                    }
//                }
//            }
//        }
    }
    
    
    
//  MARK:DELEGATE-TARIH SECILINCE NE YAPACAGINI BURDA BELIRTIYORUZ.
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-YYYY" //tarih formatini belirledik.
        print("Date Selected = \(formatter.string(from: date))")
        selectedDate = date
        
    }
    
//    MARK:DELEGATE-SECILEN TERIHI TEKRAR IPTAL ETMEYE YARAR.TAKVIM SECIMININ KALDIRILMASINI YAPAR.
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-YYYY"
        print("Date De-Selected = \(formatter.string(from: date))")
        selectedDate = date
    }
    
//    MARK:DELEGATE-DOKUNARAK TARIH SECILMESINE IZIN VERILIP VERILMEDIGINI BELIRTIRIZ BURDA.
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = formatter.date(from: "13-11-2020") else {return true} //Belirtilen tarih secilemez.
        if date.compare(excludedDate) == .orderedSame {
            return false
        }
        return true
    }
    
//    MARK:DATASOURCE-HANGI TARIHTEN ITIBAREN TAKVIM AKTIF OLSUN BURDA ONU BELIRTIYORUZ.
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date() //Bu gunden itibaren olan tarihler gostericek gecmis tarihler degil.
    }
    
//    MARK:DATASOURCE-ETKINLIGIN OLDUGU BELIRTILEN TARIHE NOKTA ISARETI ILE GOSTERIR BURADA.
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "14-11-2020") else {return 0} //Belirtilen tarih secilemez.
        if date.compare(eventDate) == .orderedSame {
            return 2
        }
        return 0
    }
    
//    MARK:DELEGATEAPPEARANCE-SECILMESINI ISTEMEDIGIMIZ TARIHIN RENGINI DEGISTIRIP ACILINCA GOSTERDIK.
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = formatter.date(from: "13-11-2020") else {return nil} //Belirtilen tarih secilemez.
        if date.compare(excludedDate) == .orderedSame {
            return .red
        }
        return nil
    }

    @IBAction func reservationSaveButton(_ sender: Any) {
        
        UserDefaults.standard.setValue(selectedDate, forKey: "date")
        UserDefaults.standard.setValue(nameTextField.text, forKey: "name")
        UserDefaults.standard.setValue(surnametextField.text, forKey: "surname")
        UserDefaults.standard.setValue(phoneTextField.text, forKey: "phone")
        UserDefaults.standard.setValue(selectedPlace, forKey: "place")
        
    }
    
}
