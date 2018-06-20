//
//  ViewController.swift
//  Lecture 15 HomeWork
//
//  Created by Mac on 06.06.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schoolSubject1 = SchoolSubject()
        schoolSubject1.subjectName = "Математика"
        schoolSubject1.amountOfTime = 10
        
        let schoolSubject2 = SchoolSubject()
        schoolSubject2.subjectName = "Биология"
        schoolSubject2.amountOfTime = 15
        
        let schoolSubject3 = SchoolSubject()
        schoolSubject3.subjectName = "География"
        schoolSubject3.amountOfTime = 13
        
        let schoolKid1 = Schoolkid()
        schoolKid1.name = "Коля"
        schoolKid1.dateOfLastVisit = 1525132800 //1 мая
        
        
        let schoolKid2 = Schoolkid()
        schoolKid2.name = "Вова"
        schoolKid2.dateOfLastVisit = 1528761600 // 14 июня
        
        
        let schoolKid3 = Schoolkid()
        schoolKid3.name = "Евгений"
        schoolKid3.dateOfLastVisit = 1528588800 // 10 июня
        
        
        schoolSubject1.schoolKid.append(objectsIn: [schoolKid1,schoolKid2,schoolKid3])
        schoolSubject2.schoolKid.append(objectsIn: [schoolKid1,schoolKid2])
        schoolSubject3.schoolKid.append(objectsIn: [schoolKid1])
        schoolKid1.schoolSubject.append(objectsIn: [schoolSubject1])
        schoolKid2.schoolSubject.append(objectsIn: [schoolSubject1])
        schoolKid3.schoolSubject.append(objectsIn: [schoolSubject1,schoolSubject2,schoolSubject3])
        
        
        let realm = try! Realm()
        //try! realm.write {
        //realm.deleteAll()
        //realm.add([schoolSubject1,schoolSubject2,schoolSubject3,schoolKid1,schoolKid2,schoolKid3])
        
        
        
        //Работает!
        //let thirdTask = realm.objects(Schoolkid.self).filter("name = 'Евгений'")
        //realm.delete(thirdTask)
        //}
        
        
        
        //Найти всех учеников, которые не посещали школу неделю и имеют хотя бы один предмет.
        let firstTask = realm.objects(Schoolkid.self).filter("dateOfLastVisit >= 1528588700 AND schoolSubject.@count > 1")
        print(firstTask)
        
        
        
        //Самый загруженый ученик.
        let children = realm.objects(Schoolkid.self)
        let childrenArray = Array(children)
        let childrenFirst = childrenArray.first?.schoolSubject.count
        var max = 0
        
        for i in childrenArray {
            if childrenFirst! < i.schoolSubject.count {
               max = i.schoolSubject.count
            }
            
        }
        
        let childrenMax = children.filter("schoolSubject.@count = \(max)")
        print(childrenMax)
    
        //Посчитать общее количество часов по предметам для каждого такого ученика отдельно и в общем.
        
        let sumHours = Array(realm.objects(SchoolSubject.self)) //.reduce(0, { ($0 + $1)})
        var sum = 0
        for i in sumHours {
            sum += i.amountOfTime
        }
        print(sum)

        
    }
}
