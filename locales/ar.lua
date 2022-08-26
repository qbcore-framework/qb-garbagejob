local Translations = {
    error = {
        ["cancled"] = "فشل",
        ["no_truck"] = "ليس لديك شاحنة",
        ["not_enough"] = "(%{value} مطلوب) بيس لديك اموال كافية",
        ["too_far"] = "أنت بعيد جدًا عن نقطة الإنزال",
        ["early_finish"] = "(%{completed} أكملت: | %{total} المجموع:)",
        ["never_clocked_on"] = "You never clocked on!",
    },
    success = {
        ["clear_routes"] = "%{value} تم مسح مسار الطريق لـ",
        ["pay_slip"] = "($%{total} المجموع | %{deposit} القسيمة:) تم الدفع لحسابك المصرفي",
    },
    info = {
        ["payslip_collect"] = "~g~E~w~ - ﻞﻴﺼﺤﺗ",
        ["payslip"] = "ﻞﻴﺼﺤﺗ",
        ["not_enough"] = "$%{value} ليس لديك ما يكفي من المال للإيداع. التكاليف هي",
        ["deposit_paid"] = "$%{value} تم دفع تكاليف التأمين",
        ["no_deposit"] = "ليس لديك أي إيداع مدفوع على هذه السيارة",
        ["truck_returned"] = "لقد رجعت. يمكنك استرداد اموالك من مكان تحصيل",
        ["bags_left"] = "%{value} بقي لك",
        ["bags_still"] = "%{value} الحقائب هناك",
        ["all_bags"] = "تم الانتهاء من جميع أكياس القمامة. انتقل لمكان اخر",
        ["depot_issue"] = "حدثت مشكلة في المستودع. يرجى الرجوع",
        ["done_working"] = "لقد انتهيت من العمل! ارجع إلى المستودع",
        ["started"] = "لقد بدأت العمل. تم تحديد المكان في الخريطة",
        ["grab_garbage"] = "~g~E~w~ - ﻊﻤﺟ",
        ["dispose_garbage"] = "~g~E~w~ - ﺔﻣﺎﻤﻘﻟﺍ ﺲﻴﻛ ﻦﻣ ﺺﻠﺨﺗ",
        ["progressbar"] = "جاري التخلص منها",
        ["found_crypto"] = "وجدت شيء ما",
        ["payout_deposit"] = "(+ $%{value} الوديعة)",
        ["store_truck"] =  "~g~E~w~ - ﺔﻣﺎﻤﻘﻟﺍ ﺔﻨﺣﺎﺷ ﻦﻳﺰﺨﺗ",
        ["get_truck"] =  "~g~E~w~ - ﺔﻣﺎﻤﻘﻟﺍ ﺔﻨﺣﺎﺷ",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
