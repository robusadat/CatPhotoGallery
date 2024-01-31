//
//  TimerNotificationScreenViewController.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/30/24.
//

import UIKit
import UserNotifications

class TimerNotificationScreenViewController: UIViewController {
    
    lazy var notificationContent = {
        let content = UNMutableNotificationContent()
        content.title = "Cat Food Notification"
        content.body = "Time to feed the cat"
        content.sound = UNNotificationSound.default
        
        return content
    }()
    lazy var timePickerView: UIDatePicker = {
        let pickerView = UIDatePicker()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.datePickerMode = .countDownTimer
        pickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        return pickerView
    }()
    
    lazy var notifyMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Notify Me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(notify), for: .touchUpInside)
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        // Do any additional setup after loading the view.
    }

    @objc private func notify() {
        let selectedDate = timePickerView.date
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: selectedDate)
        let minutes = calendar.component(.minute, from: selectedDate)
        
        guard minutes != 0 else { return }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(minutes) * 60 +  Double(hours) * 3600, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print(error)
            }
        }
    }
    
    private func setupView() {
        view.addSubview(timePickerView)
        view.addSubview(notifyMeButton)
        
        NSLayoutConstraint.activate([
            timePickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            timePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            notifyMeButton.topAnchor.constraint(equalTo: timePickerView.bottomAnchor, constant: 20),
            notifyMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            notifyMeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            notifyMeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

