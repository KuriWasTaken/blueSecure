return function(a)
    local comments = {
        "I've_heard_aztup_brew_is_skidded?",
        "America_Fuck_Yeah",
        "Did_you_know_that_you_can_get_free_bobux_by_giving_me_your_credit_card_info?",
        "Theres_A_Monkey_in_my_bathroooom"
    }
    return a:gsub(" ", " --[[" .. comments[math.random(1, #comments)] ..  "]] ")
end
