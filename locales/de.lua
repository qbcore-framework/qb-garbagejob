local Translations = {
    error = {
        ["cancled"] = "Abgebrochen",
        ["no_truck"] = "Du hast keinen Müllwagen!",
        ["not_enough"] = "Nicht genug Geld (%{value} benötigt)",
        ["too_far"] = "Du bist zu weit von der Abgabestelle entfernt",
        ["early_finish"] = "Wegen des frühen Endes (Abgeschlossen: %{completed} Maximal: %{total}), wird ihre Kaution nicht zurückerstattet.",
        ["never_clocked_on"] = "Du hast nicht gearbeitet!",
        ["all_occupied"] = "Alle Parkplätze sind besetzt",
        ["job"] = "Du musst den Job beim Jobcenter bekommen",
    },
    success = {
        ["clear_routes"] = "Gelöschte Benutzerrouten, die sie hatten %{value} gespeicherte Routen",
        ["pay_slip"] = "Du hast $%{total}, deine Gehaltsabrechnung %{deposit} wurde auf dein Bankkonto überwiesen!",
    },
    target = {
        ["talk"] = 'Mit Müllmann sprechen',
        ["grab_garbage"] = "Müllsack aufheben",
        ["dispose_garbage"] = "Müllsack entsorgen",
    },
    menu = {
        ["header"] = "Müllentsorgungs-Hauptmenü",
        ["collect"] = "Gehalt abholen",
        ["return_collect"] = "Fahrzeug zurückgeben und Gehalt hier abholen!",
        ["route"] = "Route anfordern",
        ["request_route"] = "Eine Müllroute anfordern",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - Gehalt",
        ["payslip"] = "Gehalt",
        ["not_enough"] = "Du hast nicht genug Geld für die Kaution. Kaution kostet $%{value}",
        ["deposit_paid"] = "Du hast $%{value} eingezahlte Anzahlung!",
        ["no_deposit"] = "Du hast keine Kaution für dieses Fahrzeug hinterlegt.",
        ["truck_returned"] = "Hole dir deinen Lohnzettel ab, um dein Gehalt und deine Kaution zurückzuerhalten!",
        ["bags_left"] = "Es gibt noch %{value} Säcke!",
        ["bags_still"] = "Es gibt noch %{value} Säcke!",
        ["all_bags"] = "Es gibt keine Müllsäcke mehr, fahre zum nächsten Ort!",
        ["depot_issue"] = "Es gab ein Problem im Depot, bitte komme sofort zurück!",
        ["done_working"] = "Du bist fertig mit der Arbeit! Gehe zurück zum Depot.",
        ["started"] = "Du hast mit der Arbeit begonnen, der Standort ist auf dem GPS markiert.",
        ["grab_garbage"] = "~g~E~w~ - Müllsack aufheben",
        ["stand_grab_garbage"] = "Bleibe hier stehen, um einen Müllsack aufzuheben.",
        ["dispose_garbage"] = "~g~E~w~ - Müllsack entsorgen",
        ["progressbar"] = "Müllsack in den Müllwagen stecken ...",
        ["garbage_in_truck"] = "Lege den Müllsack in den Müllwagen",
        ["stand_here"] = "Stehe hier...",
        ["found_crypto"] = "Du hast einen Kryptostick auf dem Boden gefunden",
        ["payout_deposit"] = "(+ $%{value} eingelagert)",
        ["store_truck"] =  "~g~E~w~ - Müllwagen einparken",
        ["get_truck"] =  "~g~E~w~ - Müllwagen",
        ["picking_bag"] = "Müllsack aufheben...",
        ["talk"] = "[E] Mit Müllmann sprechen",
    },
    warning = {},
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
