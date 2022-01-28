local Translations = {
    error = {
        ["cancled"] = "Abgebrochen",
        ["no_truck"] = "Sie haben keinen Lkw!",
        ["not_enough"] = "Nicht Genug Geld (%{value} Benötigt)",
        ["too_far"] = "Sie sind zu weit von der Abgabestelle entfernt",
        ["early_finish"] = "Wegen des frühen Endes (Abgeschlossen: %{completed} Maximal: %{total}), Ihre Kaution wird nicht zurückerstattet.",
        ["never_clocked_on"] = "You never clocked on!",
    },
    success = {
        ["clear_routes"] = "Gelöschte Benutzerrouten, die sie hatten %{value} gespeicherte Routen",
        ["pay_slip"] = "Sie haben $%{total}, Ihrer Gehaltsabrechnung %{deposit} wurde auf Ihr Bankkonto überwiesen!",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - Gehalt",
        ["payslip"] = "Geahlt",
        ["not_enough"] = "Sie haben nicht genug Geld für die Kaution. Kaution Kosten sind $%{value}",
        ["deposit_paid"] = "Sie haben $%{value}, eingezahlte Anzahlung!",
        ["no_deposit"] = "Sie haben keine Kaution für dieses Fahrzeug hinterlegt.",
        ["truck_returned"] = "Holen Sie Ihren Lohnzettel ab, um Ihr Gehalt und Ihre Kaution zurückzuerhalten!",
        ["bags_left"] = "Es gibt noch %{value} Säcke!",
        ["bags_still"] = "Es gibt noch %{value} Säcke!",
        ["all_bags"] = "Alle Müllsäcke sind fertig, fahren Sie mit dem nächsten Ort fort!",
        ["depot_issue"] = "Es gab ein Problem im Depot, bitte kommen Sie sofort zurück!",
        ["done_working"] = "Sie sind fertig mit der Arbeit! Gehen Sie zurück zum Depot.",
        ["started"] = "Sie haben mit der Arbeit begonnen, der Standort ist auf dem GPS! markiert,",
        ["grab_garbage"] = "~g~E~w~ - Nimm einen Müllsack",
        ["stand_grab_garbage"] = "Bleiben Sie hier stehen, um einen Müllsack zu holen.",
        ["dispose_garbage"] = "~g~E~w~ - Müllsack entsorgen",
        ["progressbar"] = "Tasche in den Müllschlucker stecken ...",
        ["garbage_in_truck"] = "Legen Sie die Tasche in Ihren Wagen.",
        ["stand_here"] = "Stehen Sie hier..",
        ["found_crypto"] = "Du hast einen Kryptostick auf dem Boden gefunden",
        ["payout_deposit"] = "(+ $%{value} eingelagert)",
        ["store_truck"] =  "~g~E~w~ - Müllwagen Einparken",
        ["get_truck"] =  "~g~E~w~ - Müllwagen",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
