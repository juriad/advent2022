REBOL [
]

decode: func [
  str
  /local n sum
] [
  d: [
    #"=" -2
    #"-" -1
    #"0" 0
    #"1" 1
    #"2" 2
  ]
  sum: 0.0
  foreach c str [
    n: select d c
    sum: sum * 5 + n
  ]
  sum
]

encode: func [
  n
  /local r str
] [
  str: ""
  until [
    r: n // 5
    switch r [
      0 [
        n: n / 5
        str: join "0" str
      ]
      1 [
        n: (n - 1) / 5
        str: join "1" str
      ]
      2 [
        n: (n - 2) / 5
        str: join "2" str
      ]
      3 [
        n: (n + 2) / 5
        str: join "=" str
      ]
      4 [
        n: (n + 1) / 5
        str: join "-" str
      ]
    ]
    n = 0
  ]
  str
]

file: to-file pick system/options/args 1
lines: read/lines file
; probe lines

sum: 0
foreach line lines [
  ; probe line
  sum: sum + decode line
]
print encode sum
