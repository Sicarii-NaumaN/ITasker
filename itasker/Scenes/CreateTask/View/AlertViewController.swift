////
////  AlertViewController.swift
////  itasker
////
////  Created by Kristina on 26.11.2021.
////
//
//import UIKit
//
//class AlertViewController: UIAlertController {
//
//    var alert: UIAlertController
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//    func init() {
//        alert = UIAlertController(title: "Повторять по ", message: nil, preferredStyle: .alert)
//        super.init()
//    }
//    
//    required init?(coder: NSCoder) {
//        return nil
//    }
//
//    func showAlert(_ vc: UIViewController) {
//       
//        let сancelBtn = UIAlertAction(title: "Отменить", style: .default, handler: nil)
//        alert.addAction(сancelBtn)
//        
//        vc.present(alert, animated: true, completion: nil)
//    }
//}
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
