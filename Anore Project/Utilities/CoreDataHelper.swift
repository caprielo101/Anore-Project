////
////  CoreDataHelper.swift
////  Anore Project
////
////  Created by Josiah Elisha on 21/07/19.
////  Copyright © 2019 Josiah Elisha. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class CoreDataHelper {
//    
//    static let shared = CoreDataHelper()
//    
//    let appDelegate = UIApplication.shared.delegate as? AppDelegate
//    
//    func save(_ score: Float) {
//        //save using Core Data
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//        
//        //bikin objek entity
////        let score = Score(context: managedContext)
//        //set value ke atribut
////        user.username = nameTextField.text
////        user.password = passwordTextField.text
//        
//        //commit changes
//        do {
//            try managedContext.save()
//        } catch {
//            print("Error")
//        }
//    }
//}
