//
//  File.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//

import Foundation

class ReuniaoViewModel {
    let reuniao: Reuniao
    
    init(reuniao: Reuniao){
        self.reuniao = reuniao
    }
    
    func getTitulo() -> String? {
        return reuniao.titulo
    }
    
    func getDescricao() -> String? {
        return reuniao.descricao
    }
    
    func getData() -> String? {
        return reuniao.data
    }
    
    func getHorario() -> String? {
        return reuniao.hora
    }
}
