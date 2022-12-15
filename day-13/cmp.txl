% comparison

% e - element (can be e or n)
% l - list with brackets
% f - list without brackets that has at least one item
% o - list without brackets that is empty
% n - number

% less than

function cmp_lt_l_l S [element]
    deconstruct S
        '[ SL [list element] ']
    match [element]
        '[ FL [list element] ']
    where
        FL [cmp_lt_o_f SL] [cmp_lt_f_f SL] % cmp_lt_o_o and cmp_lt_f_o are not needed
end function

function cmp_lt_o_f SL [list element]
    deconstruct SL
        SH [element] ', ST [list element]
    match [list element]
end function

function cmp_lt_f_f SL [list element]
    deconstruct SL
        SH [element] , ST [list element]
    match [list element]
        FH [element] , FT [list element]
    construct ONE [number]
        1
    where
        ONE [cmp_lt_h_h FH SH] [cmp_lt_t_t FH SH FT ST]
end function

function cmp_lt_h_h FH [element] SH [element]
    match [number]
        _ [number]
    where
        FH [cmp_lt_e_e SH]
end function

function cmp_lt_t_t FH [element] SH [element] FT [list element] ST [list element]
    match [number]
        _ [number]
    where
        FH [cmp_eq_e_e SH]
    where
        FT [cmp_lt_o_f ST] [cmp_lt_f_f ST]
end function

function cmp_lt_e_e SE [element]
    match [element]
        FE [element]
    where
        FE [cmp_lt_l_l SE] [cmp_lt_l_n SE] [cmp_lt_n_l SE] [cmp_lt_n_n SE]
end function

function cmp_lt_l_n SE [element]
    deconstruct SE
        SN [number]
    construct SL [lst]
        '[ SN ']
    construct SE2 [element]
        SL
    match [element]
        FE [element]
    deconstruct FE
        FL [lst]
    where
        FE [cmp_lt_l_l SE2]
end function

function cmp_lt_n_l SE [element]
    deconstruct SE
        SL [lst]
    match [element]
        FN [number]
    construct FL [lst]
        '[ FN ']
    construct FE2 [element]
        FL
    where
        FE2 [cmp_lt_l_l SE]
end function

function cmp_lt_n_n SE [element]
    deconstruct SE
        SN [number]
    match [element]
        FN [number]
    where
        FN [< SN]
end function

% equality

function cmp_eq_l_l S [element]
    deconstruct S
        '[ SL [list element] ']
    match [element]
        '[ FL [list element] ']
    where
        FL [cmp_eq_o_o SL] [cmp_eq_f_f SL] % cmp_eq_f_o and cmp_eq_o_f are not needed
end function

function cmp_eq_o_o SL [list element]
    deconstruct SL
    match [list element]
end function

function cmp_eq_f_f SL [list element]
    deconstruct SL
        SH [element] , ST [list element]
    match [list element]
        FH [element] , FT [list element]
    construct ONE [number]
        1
    where
        ONE [cmp_eq_h_h FH SH]
    where
        ONE [cmp_eq_t_t FT ST]
end function

function cmp_eq_h_h FH [element] SH [element]
    match [number]
        _ [number]
    where
        FH [cmp_eq_e_e SH]
end function

function cmp_eq_t_t FT [list element] ST [list element]
    match [number]
        _ [number]
    where
        FT [cmp_eq_o_o ST] [cmp_eq_f_f ST]
end function

function cmp_eq_e_e SE [element]
    match [element]
        FE [element]
    where
        FE [cmp_eq_l_l SE] [cmp_eq_l_n SE] [cmp_eq_n_l SE] [cmp_eq_n_n SE]
end function

function cmp_eq_l_n SE [element]
    deconstruct SE
        SN [number]
    construct SL [lst]
        '[ SN ']
    construct SE2 [element]
        SL
    match [element]
        FE [element]
    deconstruct FE
        FL [lst]
    where
        FE [cmp_eq_l_l SE2]
end function

function cmp_eq_n_l SE [element]
    deconstruct SE
        SL [lst]
    match [element]
        FN [number]
    construct FL [lst]
        '[ FN ']
    construct FE2 [element]
        FL
    where
        FE2 [cmp_eq_l_l SE]
end function

function cmp_eq_n_n SE [element]
    deconstruct SE
        SN [number]
    match [element]
        FN [number]
    where
        FN [= SN]
end function
