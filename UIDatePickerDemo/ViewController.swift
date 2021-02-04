//
//  ViewController.swift
//  UIDatePickerDemo
//
//  Created by Trista on 2021/2/4.
//

import UIKit

class ViewController: UIViewController {

    //建立兩個屬性
    var myDatePicker: UIDatePicker!
    var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        //使用 UIDatePicker(frame:) 建立一個 UIDatePicker
        myDatePicker = UIDatePicker(frame: CGRect(
          x: 0, y: 0,
          width: fullScreenSize.width, height: 100))

        //設置 UIDatePicker 偏好的選取模式
        myDatePicker.preferredDatePickerStyle = .wheels
        
        //設置 UIDatePicker 格式
        myDatePicker.datePickerMode = .dateAndTime

        //選取時間時的分鐘間隔 這邊以 15 分鐘為一個間隔
        myDatePicker.minuteInterval = 15

        //設置預設時間為現在時間
        myDatePicker.date = NSDate() as Date

        //設置 NSDate 的格式
        let formatter = DateFormatter()

        //設置時間顯示的格式
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        //可以選擇的最早日期時間
        let fromDateTime = formatter.date(from: "2021-01-01 00:00")

        //設置可以選擇的最早日期時間
        myDatePicker.minimumDate = fromDateTime

        //可以選擇的最晚日期時間
        let endDateTime = formatter.date(from: "2021-12-31 23:59")

        //設置可以選擇的最晚日期時間
        myDatePicker.maximumDate = endDateTime

        //設置顯示的語言環境
        myDatePicker.locale = NSLocale(
            localeIdentifier: "zh_TW") as Locale

        //設置位置並加入到畫面中
        myDatePicker.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.4)
        self.view.addSubview(myDatePicker)
        
        //設置改變日期時間時會執行動作的方法
        myDatePicker.addTarget(self,
                               action:
                                #selector(ViewController.datePickerChanged),
                               for: .valueChanged)
        
        
        //建立一個 UILabel 來顯示改變日期時間後的結果
        myLabel = UILabel(frame: CGRect(
          x: 0, y: 0,
          width: fullScreenSize.width, height: 50))
        myLabel.backgroundColor = UIColor.lightGray
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor.black
        myLabel.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.15)
        self.view.addSubview(myLabel)
    }

    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        //設置顯示在 UILabel 的日期時間格式
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        //更新 UILabel 的內容
        myLabel.text = formatter.string(
            from: datePicker.date)
    }

}

