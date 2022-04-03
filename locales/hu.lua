local Translations = {
    error = {
        ["cancled"] = "Visszavonva",
        ["no_truck"] = "Nincs kukásautód!",
        ["not_enough"] = "Nincs elég pénzed (%{value} szükséges)",
        ["too_far"] = "Túl messze vagy a lerakási ponttól",
        ["early_finish"] = "A korai befejezés miatt (Elvégezve: %{completed} Összes: %{total}), a letéted nem kerül visszatérítésre.",
        ["never_clocked_on"] = "Nem álltál be munkába!",
    },
    success = {
        ["clear_routes"] = "Játékos útvonalai (%{value} db) törölve",
        ["pay_slip"] = "Kaptál $%{total}, a nyugta %{deposit} a bankszámládra utalva!",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - Nyugta",
        ["payslip"] = "Nyugta",
        ["not_enough"] = "Nincs elég pénzed a letéthez. A szükséges pénzösszeg $%{value}",
        ["deposit_paid"] = "Letét befizetve, $%{value} forint!",
        ["no_deposit"] = "Nincs letét fizetve ehhez a járműhöz..",
        ["truck_returned"] = "A kukásautó a helyén, vedd el a nyugtát, hogy megkapd a fizetésed és a letétet!",
        ["bags_left"] = "Még hátravan %{value} zsák!",
        ["bags_still"] = "Még maradt egy zsák!",
        ["all_bags"] = "Minden szemeteszsák berakodva, menj a következő helyre!",
        ["depot_issue"] = "Probléma volt a raktárnál, kérlek menj vissza azonnal!",
        ["done_working"] = "Végeztél a munkával! Menj vissza a raktárhoz.",
        ["started"] = "Elkezdtél dolgozni, a GPS-n jelzett helyen!,",
        ["grab_garbage"] = "[E] Vegyél egy szemeteszsákot",
        ["stand_grab_garbage"] = "Innen vegyél szemeteszsákot.",
        ["dispose_garbage"] = "[E] Dobd ki a szemeteszsákot",
        ["progressbar"] = "Zsák bepakolása a kukásautóba ..",
        ["garbage_in_truck"] = "Tedd a zsákot a kukásautóba.",
        ["stand_here"] = "Állj ide.",
        ["found_crypto"] = "Találtál egy kriptovalutát tartalmazó USB-t a földön!",
        ["payout_deposit"] = "(+ $%{value} letét)",
        ["store_truck"] =  "~g~E~w~ - Kukásautó Tárolása",
        ["get_truck"] =  "~g~E~w~ - Kukásautó",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
