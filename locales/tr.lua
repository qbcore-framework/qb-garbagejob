local Translations = {
    error = {
        ["cancled"] = "İptal edildi",
        ["no_truck"] = "Kamyonun yok!",
        ["not_enough"] = "Yeterli Paran Yok (%{value} gerekli)",
        ["too_far"] = "Bırakma noktasından çok uzaktasın",
        ["early_finish"] = "Erken bitirme nedeniyle (Tamamlandı: %{completed} Toplam: %{total}), depozitonuz iade edilmeyecektir.",
        ["never_clocked_on"] = "Hiç mesaiye başlamadın!",
    },
    success = {
        ["clear_routes"] = "Kullanıcıların kayıtlı %{value} rotalası temizlendi",
        ["pay_slip"] = "$%{total} aldınız, maaş bordronuz %{deposit} banka hesabınıza ödendi!",
    },
    info = {
        ["payslip_collect"] = "[E] - Maaş bordrosu",
        ["payslip"] = "Maaş bordrosu",
        ["not_enough"] = "Depozito için yeterli paranız yok. Depozito maliyeti $%{value}",
        ["deposit_paid"] = "$%{value} tutarında depozito ödediniz!",
        ["no_deposit"] = "Bu araç için ödemiş olduğunuz depozito yok..",
        ["truck_returned"] = "Kamyon iade edildi, depozitonuzu ve ödemenizi almak için maaş bordronuzu alın!",
        ["bags_left"] = "Hala %{value} torba kaldı!",
        ["bags_still"] = "Orada hala %{value} torba var!",
        ["all_bags"] = "Tüm çöp torbaları bitti, bir sonraki konuma geçin!",
        ["depot_issue"] = "Depoda bir sorun oluştu, lütfen hemen geri dönün!",
        ["done_working"] = "Çalışmanız bitti! Depoya geri dön.",
        ["started"] = "Çalışmaya başladınız, konum GPS'te işaretlendi!",
        ["grab_garbage"] = "[E] Çöp torbası al",
        ["dispose_garbage"] = "[E] Çöp Torbasını Atın",
        ["progressbar"] = "Torba çöp arabasına koyuluyor ..",
        ["found_crypto"] = "Yerde bir kripto çubuğu buldun",
        ["payout_deposit"] = "(+ $%{value} depozito)",
        ["store_truck"] =  "[E] - Çöp Kamyonunu Depola",
        ["get_truck"] =  "[E] - Çöp Kamyonu",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
