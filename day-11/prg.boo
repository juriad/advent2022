import System.IO
import System.Numerics.BigInteger

class Monkey:
    def constructor(lines as List):
        m = lines[0] as string
        m = m[m.IndexOf(' ') + 1 : m.IndexOf(':')]
        _index = int.Parse(m)

        ws = lines[1] as string
        ws = ws[ws.IndexOf(':') + 2 : ]
        _items = List(@/, /.Split(ws))
        for i, ii in enumerate(_items):
            _items[i] = System.Numerics.BigInteger.Parse(ii)

        op = lines[2] as string
        if op.IndexOf("+") >= 0:
            _op = "+"
        else:
            _op = "*"
        p = op[op.LastIndexOf(" ") + 1 :]
        if p == "old":
            _param = -1
        else:
            _param = int.Parse(p)

        d = lines[3] as string
        d = d[d.LastIndexOf(" ") + 1 :]
        _div = int.Parse(d)

        t = lines[4] as string
        t = t[t.LastIndexOf(" ") + 1 :]
        _true = int.Parse(t)

        f = lines[5] as string
        f = f[f.LastIndexOf(" ") + 1 :]
        _false = int.Parse(f)

        _ins = 0

    def ToString() as string:
        return "" + _index + ": " + join(_items, ", ") + " (" + _ins + ")"

    [Getter(Index)]
    _index as int

    [Property(Items)]
    _items as List

    [Getter(Div)]
    _div as int

    [Getter(Op)]
    _op as string

    [Getter(OpParam)]
    _param as int

    [Getter(ThrowTrue)]
    _true as int

    [Getter(ThrowFalse)]
    _false as int

    [Getter(Inspected)]
    _ins as int

    def Inspect(item as System.Numerics.BigInteger) as System.Numerics.BigInteger:
        _ins++
        p = _param cast System.Numerics.BigInteger
        if p < 0:
            p = item
        if _op == "+":
            i = item + p
        else:
            i = item * p
        return i

    def Target(worry as System.Numerics.BigInteger) as int:
        if worry % _div == 0:
            return _true
        else:
            return _false

def Round(monkeys as List, dimin as int, modulo as int) as void:
    for m as Monkey in monkeys:
        for i as System.Numerics.BigInteger in m.Items:
            w = m.Inspect(i)
            if dimin != 1:
                w = w / dimin
            if modulo != 1:
                w = w % modulo
            t = m.Target(w)
            (monkeys[t] as Monkey).Items.Add(w)

        m.Items = []

def LoadMonkeys(file as string) as List:
    lines = []
    using input = StreamReader(file):
        for line in input:
            lines.Add(line)

    ms = []
    for m in range(0, len(lines), 7):
        ms.Add(Monkey(lines[m : m+7]))
    return ms

def Task(monkeys as List, iter as int, dimin as int, modulo as int) as void:
    for i in range(0, iter):
        Round(monkeys, dimin, modulo)

    for m as Monkey in monkeys:
        print m

    m1 = -1
    m2 = -1

    for m as Monkey in monkeys:
        if m.Inspected > m2:
            m2 = m.Inspected
        if m2 > m1:
            t = m1
            m1 = m2
            m2 = t

    print ((m1 cast System.Numerics.BigInteger) * (m2 cast System.Numerics.BigInteger))

def Main(argv as (string)) as void:
    ms = LoadMonkeys(argv[0])
    Task(ms, 20, 3, 1)
    ms = LoadMonkeys(argv[0])
    modulo = 1
    for m as Monkey in ms:
        modulo *= m.Div
    Task(ms, 10000, 1, modulo)
