//
//  Service.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//

import Foundation
import UIKit

class Service {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(titulo: String, descricao: String, endereco: String, data: String, hora: String){
        let reuniao: Reuniao = .init(context: context)
        reuniao.titulo = titulo
        reuniao.descricao = descricao
        reuniao.endereco = endereco
        reuniao.data = data
        reuniao.hora = hora
        
        saveContext()
    }
    
    
    func saveContext(){
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    func fetch() -> [Reuniao] {
        do {
            return try context.fetch(Reuniao.fetchRequest())
        } catch {
            print(error)
        }
        return []
    }
    
    func remove(reuniao: Reuniao){
        context.delete(reuniao)
        saveContext()
    }
}
