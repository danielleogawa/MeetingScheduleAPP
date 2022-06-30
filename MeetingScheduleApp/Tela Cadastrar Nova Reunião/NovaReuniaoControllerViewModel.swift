//
//  NovaReuniaoControllerViewModel.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//

import Foundation

protocol NovaReuniaoControllerViewModelDelegate {
    func fecharTela()
    func alertaInformacoesInvalidas()
}
class NovaReuniaoControllerViewModel {
    var service = Service()
    var reunioes: [Reuniao] = []
    var delegate: NovaReuniaoControllerViewModelDelegate?
    
    func carregarReunioes(){
        reunioes = service.fetch()
    }
    
    func adicionarReuniao(titulo: String?, descricao: String?, endereco: String?, data: String?, horario: String?) {
        if let tituloString = titulo, let descricaoString = descricao, let enderecoString = endereco, let dataString = data, let horarioString = horario {
            if tituloString != "", descricaoString != "",  enderecoString != "", dataString != "", horarioString != "" {
                service.save(
                    titulo: tituloString,
                    descricao: descricaoString,
                    endereco: enderecoString,
                    data: dataString,
                    hora: horarioString
                )
            carregarReunioes()
            delegate?.fecharTela()
            } else {
                delegate?.alertaInformacoesInvalidas()
            }
        }
    }
}
