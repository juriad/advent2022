include "g.txl"
include "cmp.txl"

% main

function main
    replace [program]
        GS [repeat group]
    by
        GS [expand] [extra 2] [extra 6] [sort] [index_product_groups 1] [product]
end function

function expand
    replace [repeat group]
        H [group] T [repeat group]
    deconstruct H
        L1 [lst] L2 [lst]

    construct L [lst]
        '[ 0 ']
    construct G1 [group]
        L1 L
    construct G2 [group]
        L2 L
    construct T2 [repeat group]
        T [expand]
    by
        G1 G2 T2
end function

function extra N [number]
    replace [repeat group]
        GS [repeat group]
    construct M1 [lst]
        '[ N ']
    construct M2 [element]
        M1
    construct M3 [lst]
        '[ M2 ']
    construct N1 [lst]
        '[ 1 ']
    construct EG [group]
        M3 N1
    by
        EG GS
end function

rule sort
    replace [repeat group]
        G1 [group] G2 [group] GS [repeat group]
    deconstruct G1
        L11 [lst] L12 [lst]
    deconstruct G2
        L21 [lst] L22 [lst]
    construct E1 [element]
        L11
    construct E2 [element]
        L21
    where not
        E1 [cmp_lt_l_l E2]
    by
        G2 G1 GS
end rule


function index_product_groups I [number]
    replace [repeat group]
        H [group] T [repeat group]
    construct I2 [number]
        I [+ 1]
    construct T2 [repeat group]
        T [index_product_groups I2]

    deconstruct H
        _ [lst] M1 [lst]
    deconstruct M1
        '[ M2 [element] ']
    deconstruct M2
        N [number]

    construct ONE [number]
        1
    construct G [group]
        I N
    by
        G T2
end function

function fake_product_groups
    replace [repeat group]
    construct ONE [number]
        1
    by
        ONE ONE
end function

function product
    replace [repeat group]
        H [group] T [repeat group]
    deconstruct H
        I [number] N [number]
    construct T2 [repeat group]
        T [product] [fake_product_groups]
    deconstruct T2
        T3 [group]
    deconstruct T3
        M [number] P [number]

    construct R [number]
        N [result1 I P] [result0 I P]
    by
        M R
end function

function result1 I [number] P [number]
    replace [number]
        N [number]
    where
        N [= 1]
    construct R [number]
        I [* P]
    by
        R
end function

function result0 I [number] P [number]
    replace [number]
        N [number]
    where
        N [= 0]
    by
        P
end function
