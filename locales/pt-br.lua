local Translations = {
    error = {
        ["cancled"] = "Cancelado",
        ["no_truck"] = "Você não possui um caminhão!",
        ["not_enough"] = "Dinheiro Insuficiente (%{value} necessário)",
        ["too_far"] = "Você está muito longe do ponto de entrega",
        ["early_finish"] = "Devido ao término antecipado (Concluído: %{completed} Total: %{total}), seu depósito não será devolvido.",
        ["never_clocked_on"] = "Você nunca bateu o ponto!",
        ["all_occupied"] = "Todas as vagas de estacionamento estão ocupadas",
        ["job"] = "Você deve pegar o emprego no centro de empregos",
    },
    success = {
        ["clear_routes"] = "Rotas do usuário apagadas, eles tinham %{value} rotas armazenadas",
        ["pay_slip"] = "Você recebeu $%{total}, seu recibo de pagamento de %{deposit} foi pago em sua conta bancária!",
    },
    target = {
        ["talk"] = 'Converse com o Lixeiro',
        ["grab_garbage"] = "Pegar saco de lixo",
        ["dispose_garbage"] = "Descartar Saco de Lixo",
    },
    menu = {
        ["header"] = "Menu Principal de Coleta de Lixo",
        ["collect"] = "Coletar Salário",
        ["return_collect"] = "Devolver o caminhão e coletar o salário aqui!",
        ["route"] = "Solicitar Rota",
        ["request_route"] = "Solicitar uma rota de coleta de lixo",
    },
    info = {
        ["payslip_collect"] = "[E] - Recibo de pagamento",
        ["payslip"] = "Recibo de pagamento",
        ["not_enough"] = "Você não possui dinheiro suficiente para o depósito.. O custo do depósito é de $%{value}",
        ["deposit_paid"] = "Você pagou um depósito de $%{value}!",
        ["no_deposit"] = "Você não pagou nenhum depósito neste veículo..",
        ["truck_returned"] = "Caminhão devolvido, colete seu recibo de pagamento para receber seu pagamento e depósito de volta!",
        ["bags_left"] = "Ainda há %{value} sacos de lixo!",
        ["bags_still"] = "Ainda há %{value} saco de lixo lá!",
        ["all_bags"] = "Todos os sacos de lixo estão feitos, siga para a próxima localização!",
        ["depot_issue"] = "Houve um problema no depósito, por favor, retorne imediatamente!",
        ["done_working"] = "Você terminou o trabalho! Volte para o depósito.",
        ["started"] = "Você começou a trabalhar, a localização está marcada no GPS!",
        ["grab_garbage"] = "[E] Pegar um saco de lixo",
        ["stand_grab_garbage"] = "Fique aqui para pegar um saco de lixo.",
        ["dispose_garbage"] = "[E] Descartar Saco de Lixo",
        ["progressbar"] = "Colocando o saco no caminhão de lixo...",
        ["garbage_in_truck"] = "Coloque o saco no seu caminhão...",
        ["stand_here"] = "Fique aqui...",
        ["found_crypto"] = "Você encontrou um pen drive criptografado no chão",
        ["payout_deposit"] = "(+ $%{value} de depósito)",
        ["store_truck"] =  "[E] - Guardar Caminhão de Lixo",
        ["get_truck"] =  "[E] - Caminhão de Lixo",
        ["picking_bag"] = "Pegando um saco de lixo...",
        ["talk"] = "[E] Conversar com o Lixeiro",
    },
}


if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
