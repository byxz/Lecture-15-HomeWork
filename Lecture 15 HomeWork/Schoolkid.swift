//
//  Schoolkid.swift
//  Lecture 15 HomeWork
//
//  Created by Mac on 06.06.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import RealmSwift

class Schoolkid: Object {
    
    
    @objc dynamic var name: String = ""
    @objc dynamic var dateOfLastVisit: Int = Int(Date().timeIntervalSince1970)
    
    @objc dynamic var owner: SchoolSubject?
}
