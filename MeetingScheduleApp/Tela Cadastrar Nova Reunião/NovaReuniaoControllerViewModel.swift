//
//  NovaReuniaoControllerViewModel.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//

import Foundation


class NovaReuniaoControllerViewModel {
    var service = Service()
    var reunioes: [Reuniao] = []
    
    func carregarReunioes(){
        reunioes = service.fetch()
    }
    
    func adicionarReuniao(titulo: String?, descricao: String?, endereco: String?, data: String?, horario: String?) {
        
        service.save(titulo: titulo, descricao: descricao, endereco: endereco, data: data, hora: horario)
        carregarReunioes()
 
    }
}
