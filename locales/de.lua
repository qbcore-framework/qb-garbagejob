local Translations = {
    error = {
        ["cancled"] = "Abgebrochen",
        ["no_truck"] = "Du hast keinen Müllwagen!",
        ["not_enough"] = "Nicht Genug Geld (%{value} Benötigt)",
        ["too_far"] = "Du bist zu weit von der Abgabestelle entfernt",
        ["early_finish"] = "Wegen des frühen Endes (Abgeschlossen: %{completed} Maximal: %{total}), Wird ihre Kaution nicht zurückerstattet.",
        ["never_clocked_on"] = "Du hast nicht gearbeitet!",
    },
    success = {
        ["clear_routes"] = "Gelöschte Benutzerrouten, die sie hatten %{value} gespeicherte Routen",
        ["pay_slip"] = "Du hast $%{total}, Deine Gehaltsabrechnung %{deposit} wurde auf dein Bankkonto überwiesen!",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - Gehalt",
        ["payslip"] = "Geahlt",
        ["not_enough"] = "Du hast nicht genug Geld für die Kaution. Kaution Kosten sind $%{value}",
        ["deposit_paid"] = "Du hast $%{value}, eingezahlte Anzahlung!",
        ["no_deposit"] = "Du hast keine Kaution für dieses Fahrzeug hinterlegt.",
        ["truck_returned"] = "Hole dir deinen Lohnzettel ab, um dein Gehalt und deine Kaution zurückzuerhalten!",
        ["bags_left"] = "Es gibt noch %{value} Säcke!",
        ["bags_still"] = "Es gibt noch %{value} Säcke!",
        ["all_bags"] = "Es gibt keine Müllsäcke mehr, fahren zu dem nächsten Ort!",
        ["depot_issue"] = "Es gab ein Problem im Depot, bitte komme sofort zurück!",
        ["done_working"] = "Du bist fertig mit der Arbeit! Gehe zurück zum Depot.",
        ["started"] = "Du hast mit der Arbeit begonnen, der Standort ist auf dem GPS! markiert,",
        ["grab_garbage"] = "~g~E~w~ - Nimm einen Müllsack",
        ["dispose_garbage"] = "~g~E~w~ - Müllsack entsorgen",
        ["progressbar"] = "Müllsack in den Müllwagen stecken ...",
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
