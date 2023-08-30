local Translations = {
    error = {
        ["cancled"] = "Cancelado",
        ["no_truck"] = "Você não possui um caminhão!",
        ["not_enough"] = "Dinheiro Insuficiente (necessário %{value})",
        ["too_far"] = "Você está muito longe do ponto de entrega",
        ["early_finish"] = "Devido ao término antecipado (Concluído: %{completed} Total: %{total}), seu depósito não será devolvido.",
        ["never_clocked_on"] = "Você nunca bateu o ponto!",
        ["all_occupied"] = "Todas as vagas de estacionamento estão ocupadas",
        ["job"] = "Você precisa pegar o trabalho no centro de empregos",
    },
    success = {
        ["clear_routes"] = "Rotas dos usuários foram limpas, eles tinham %{value} rotas armazenadas",
        ["pay_slip"] = "Você recebeu $%{total}, seu holerite %{deposit} foi pago em sua conta bancária!",
    },
    target = {
        ["talk"] = 'Conversar com o Coletor de Lixo',
        ["grab_garbage"] = "Pegar saco de lixo",
        ["dispose_garbage"] = "Descartar saco de lixo",
    },
    menu = {
        ["header"] = "Menu Principal do Coletor de Lixo",
        ["collect"] = "Receber Salário",
        ["return_collect"] = "Devolver caminhão e receber salário aqui!",
        ["route"] = "Solicitar Rota",
        ["request_route"] = "Solicitar uma rota de coleta de lixo",
    },
    info = {
        ["payslip_collect"] = "[E] - Holerite",
        ["payslip"] = "Holerite",
        ["not_enough"] = "Você não tem dinheiro suficiente para o depósito. O depósito custa $%{value}",
        ["deposit_paid"] = "Você pagou $%{value} de depósito!",
        ["no_deposit"] = "Você não pagou nenhum depósito neste veículo.",
        ["truck_returned"] = "Caminhão devolvido, receba seu holerite para receber seu pagamento e depósito de volta!",
        ["bags_left"] = "Ainda há %{value} sacos de lixo restantes!",
        ["bags_still"] = "Ainda há %{value} saco de lixo ali!",
        ["all_bags"] = "Todos os sacos de lixo foram coletados, siga para o próximo local!",
        ["depot_issue"] = "Houve um problema no depósito, por favor, retorne imediatamente!",
        ["done_working"] = "Você terminou o trabalho! Volte para o depósito.",
        ["started"] = "Você começou a trabalhar, a localização está marcada no GPS!",
        ["grab_garbage"] = "[E] Pegar um saco de lixo",
        ["stand_grab_garbage"] = "Fique aqui para pegar um saco de lixo.",
        ["dispose_garbage"] = "[E] Descartar saco de lixo",
        ["progressbar"] = "Colocando o saco na máquina de lixo...",
        ["garbage_in_truck"] = "Coloque o saco no caminhão...",
        ["stand_here"] = "Fique aqui...",
        ["found_crypto"] = "Você encontrou um criptopendrive no chão",
        ["payout_deposit"] = "(+ $%{value} de depósito)",
        ["store_truck"] =  "[E] - Guardar Caminhão de Lixo",
        ["get_truck"] =  "[E] - Caminhão de Lixo",
        ["picking_bag"] = "Pegando saco de lixo...",
        ["talk"] = "[E] Conversar com o Coletor de Lixo",
    },
}

Lang = Lang ou Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
