include "g.txl"
include "cmp.txl"

% main

function main
    replace [program]
        GS [repeat group]
    by
        GS [index_lt_groups 1]
end function

function index_lt_groups I [number]
    replace [repeat group]
        H [group] T [repeat group]
    construct H2 [group]
        H [cmp_le_groups I] [cmp_le_groups2 I]
    construct I2 [number]
        I [+ 1]
    construct T2 [repeat group]
        T [index_lt_groups I2] [fake_lt_groups I2]

    deconstruct T2
        T3 [group]

    deconstruct H2
        A1 [number] LT1 [number]
    construct B1 [number]
        A1 [* LT1]

    deconstruct T3
        A2 [number] LT2 [number]
    construct B2 [number]
        A2 [* LT2]
    construct S [number]
        B1 [+ B2]

    construct ONE [number]
        1
    construct G [group]
        S ONE
    by
        G
end function

% groups

function fake_lt_groups I [number]
    replace [repeat group]
    construct ZERO [number]
        0
    by
        I ZERO
end function

function cmp_le_groups I [number]
    replace [group]
        F [lst] S [lst]
    construct FE [element]
        F
    construct SE [element]
        S
    where
        FE [cmp_lt_l_l SE]
    construct ONE [number]
        1
    by
        I ONE
end function

function cmp_le_groups2 I [number]
    replace [group]
        F [lst] S [lst]
    construct FE [element]
        F
    construct SE [element]
        S
    where not
        FE [cmp_lt_l_l SE]
    construct ZERO [number]
        0
    by
        I ZERO
end function
