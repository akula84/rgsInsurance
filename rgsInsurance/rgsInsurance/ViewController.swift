//
//  ViewController.swift
//  rgsInsurance
//
//  Created by Артем Кулагин on 08.04.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLabel()
    }
    
    @IBAction func actionSiteRgs(_ sender: Any) {
        openLink("https://www.rgs.ru")
    }
    
    @IBAction func openApp(_ sender: Any) {
        openLink("https://apps.apple.com/app/id1501529085")
    }
    
    func openLink(_ text: String?) {
        guard let text = text,
            let url = URL(string: text) else {
            return
        }
        let shared = UIApplication.shared
        if #available(iOS 10.0, *) {
            shared.open(url)
        } else {
            if shared.canOpenURL(url) {
                shared.openURL(url)
            }
        }
    }
    
    func prepareLabel() {
        let font = UIFont.systemFont(ofSize: 15)
        var black: [NSAttributedString.Key: Any] {
            [.foregroundColor: UIColor.black,
             .font: font]
        }

        var red: [NSAttributedString.Key: Any] {
            [.foregroundColor: #colorLiteral(red: 0.5294117647, green: 0.1294117647, blue: 0.1098039216, alpha: 1),
             .font: font]
        }

        let attr = NSMutableAttributedString(string: "Просим вас пользоваться сервисами нашего сайта ", attributes: black)
        attr.append(NSAttributedString(string: "rgs.ru", attributes: red))
        attr.append(NSAttributedString(string: ", который оптимизирован для отображения на мобильных устройствах.", attributes: black))
        
        label.attributedText = attr
    }
}
