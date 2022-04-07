local Translations = {
    error = {
        ["cancled"] = "Geannuleerd",
        ["no_truck"] = "Je hebt geen vrachtwagen!",
        ["not_enough"] = "Niet genoeg geld (%{value} vereist)",
        ["too_far"] = "Je bent te ver weg van het inleverpunt",
        ["early_finish"] = "Wegens vroege voltooiing (Voltooid: %{completed} Totaal: %{total}), wordt uw aanbetaling niet geretourneerd.",
        ["never_clocked_on"] = "Je hebt nooit ingeklokt!",
    },
    success = {
        ["clear_routes"] = "Routes van gebruikers gewist, ze hadden %{value} routes opgeslagen",
        ["pay_slip"] = "Je hebt $%{total} gekregen, je loonstrookje %{deposit} is op je bankrekening gestort!",
    },
    info = {
        ["payslip_collect"] = "[E] - Loonstrook",
        ["payslip"] = "Loonstrook",
        ["not_enough"] = "Je hebt niet genoeg geld voor de aanbetaling. De aanbetalingskosten zijn $%{value}",
        ["deposit_paid"] = "Je hebt $%{value} aanbetaling betaald!",
        ["no_deposit"] = "Je hebt voor dit voertuig geen borg betaald.",
        ["truck_returned"] = "Vrachtwagen geretourneerd, haal je loonstrook op om je loon en borg terug te ontvangen!",
        ["bags_left"] = "Er zijn nog %{value} zakken over!",
        ["bags_still"] = "Er zijn daar nog %{value} zakken!",
        ["all_bags"] = "Alle vuilniszakken zijn klaar, ga door naar de volgende locatie!",
        ["depot_issue"] = "Er was een probleem in het depot, gelieve onmiddellijk terug te keren!",
        ["done_working"] = "Je bent klaar met werken! Ga terug naar het depot.",
        ["started"] = "Je bent begonnen met werken, locatie gemarkeerd op GPS!",
        ["grab_garbage"] = "[E] Pak een vuilniszak",
        ["stand_grab_garbage"] = "Sta hier om een vuilniszak te pakken.",
        ["dispose_garbage"] = "[E] Gooi vuilniszak",
        ["progressbar"] = "Zak in vuilniswagen gooien..",
        ["garbage_in_truck"] = "Gooi de zak in je vrachtwagen..",
        ["stand_here"] = "Sta hier..",
        ["found_crypto"] = "Je hebt een cryptostick op de grond gevonden",
        ["payout_deposit"] = "(+ $%{value} borg)",
        ["store_truck"] =  "[E] - Vuilniswagen retourneren",
        ["get_truck"] =  "[E] - Vuilniswagen",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
