local Translations = {
    error = {
        ["cancled"] = "Cancelado",
        ["no_truck"] = "Não tens camião!",
        ["not_enough"] = "Dinheiro insuficiente (%{value} necessário)",
        ["too_far"] = "Estás demasiado afastado do ponto de entrega",
        ["early_finish"] = "Devido a final antecipado (Completado: %{completed} Total: %{total}), o teu depósito não será devolvido.",
        ["never_clocked_on"] = "Não entraste de serviço!",
        ["all_occupied"] = "Todos os lugares de estacionamento estão ocupados",
    },
    success = {
        ["clear_routes"] = "Apagaste as rotas dos utilizadores. Existiam %{value} rotas guardadas",
        ["pay_slip"] = "Fizeste $%{total}, a tua folha de pagamento de %{deposit} foi depositada no teu banco!",
    },
    target = {
        ["talk"] = 'Falar com o lixeiro',
        ["grab_garbage"] = "Apanhar saco do lixo",
        ["dispose_garbage"] = "Despejar saco do lixo",
    },
    menu = {
        ["header"] = "Lixeiro - Menu",
        ["collect"] = "Receber Salário",
        ["return_collect"] = "Entregar o camião e receber o salário",
        ["route"] = "Requerer rota",
        ["request_route"] = "Requerer rota para colectar o lixo",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - Folha de Pagamento",
        ["payslip"] = "Pagamento",
        ["not_enough"] = "Não tens dinheiro suficiente para o depósito... Os custos de depósito são de $%{value}",
        ["deposit_paid"] = "Pagaste um depósito de $%{value}!",
        ["no_deposit"] = "Não tens nenhum valor de depósito pago neste veįculo...",
        ["truck_returned"] = "Camião devolvido, recebe a tua folha de pagamento para receberes o teu dinheiro e o depósito de volta!",
        ["bags_left"] = "Ainda faltam apanhar %{value} sacos!",
        ["bags_still"] = "Ainda ali estão %{value} sacos!",
        ["all_bags"] = "Todos os sacos do lixo foram apanhados, segue para o próximo local!",
        ["depot_issue"] = "Temos um problema na Central, por favor regressa imediatamente!",
        ["done_working"] = "O teu trabalho está concluído! Regressa para a Central.",
        ["started"] = "Iniciaste o teu trabalho, local adicionado no GPS!",
        ["grab_garbage"] = "~g~E~w~ - Apanhar Saco de Lixo",
        ["stand_grab_garbage"] = "Fica aqui para apanhares um saco de lixo...",
        ["dispose_garbage"] = "~g~E~w~ - Despeja o Saco de Lixo",
        ["progressbar"] = "A colocar o saco no contentor do camião...",
        ["garbage_in_truck"] = "Coloca o saco no camião...",
        ["stand_here"] = "Fica aqui...",
        ["found_crypto"] = "Encontraste uma criptostick no chão",
        ["payout_deposit"] = "(+ $%{value} depósito)",
        ["store_truck"] =  "~g~E~w~ - Guardar Camião do Lixo",
        ["get_truck"] =  "~g~E~w~ - Camião do Lixo",
        ["picking_bag"] = "A recolher saco do lixo..",
        ["talk"] = "[E] Falar com o lixeiro",
    },
}

if GetConvar('qb_locale', 'en') == 'pt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
