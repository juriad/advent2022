% grammar

define program
    [repeat group]
end define

define group
        [FL] [lst] [lst]
    |   [FL] [number] [number]
end define

define lst
    '[ [list element] ']
end define

define element
        [number]
    |   [lst]
end define
