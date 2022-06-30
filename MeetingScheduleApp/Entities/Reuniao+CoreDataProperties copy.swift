//
//  Reuniao+CoreDataProperties.swift
//  
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//
//

import Foundation
import CoreData


extension Reuniao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reuniao> {
        return NSFetchRequest<Reuniao>(entityName: "Reuniao")
    }

    @NSManaged public var titulo: String?
    @NSManaged public var descricao: String?
    @NSManaged public var endereco: String?
    @NSManaged public var data: String?
    @NSManaged public var hora: String?

}
