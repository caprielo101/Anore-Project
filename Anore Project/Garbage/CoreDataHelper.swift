////
////  CoreDataHelper.swift
////  Anore Project
////
////  Created by Josiah Elisha on 21/07/19.
////  Copyright © 2019 Josiah Elisha. All rights reserved.
////
//
//import UIKit
//import Foundation
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
//    
//    func fetch() -> Scores {
//
//        var result: Scores!
//
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return result}
//        
//        
//        do {
//            result = try managedContext.fetch(Scores.fetchRequest()) as! Scores
//            
//            print(result)
//        
////            for user in users {
////                let username = user.username
////                let password = user.password
////
////                //print/show di label
////                myLabel.text = "\(username), \(password)"
////            }
//            
//        } catch {
//            print("Error")
//        }
//        
//        return result
//    }
//}
