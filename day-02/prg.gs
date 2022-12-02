uses Gee

class Strat:Object
	prop played:string
	prop reaction:string

	def to_string() : string
		return @"$played -> $reaction"

class Rules:Object
	def result(played: string, reaction: string): string
		if played == reaction
			return "Draw"
		else if played == "Rock" and reaction == "Paper" or played == "Paper" and reaction == "Scissors" or played == "Scissors" and reaction == "Rock"
			return "Won"
		else
			return "Lost"


	def counter(played: string, result: string): string
		if result == "Draw"
			return played
		else if played == "Scissors" and result == "Won" or played == "Paper" and result == "Lost"
			return "Rock"
		else if played == "Rock" and result == "Won" or played == "Scissors" and result == "Lost"
			return "Paper"
		else
			return "Scissors"
		

def calc(played:string, reaction: string, r: Rules, e: dict of string,int): int
	var pts = e[reaction]
	var res = e[r.result(played, reaction)]
	// print(@"$played x $reaction -> $pts + $res")
	return pts + res


init
	var filename = args[1]
	loaded:bool = false
	content:string
	try
		loaded = FileUtils.get_contents( filename, out content )
	except error:FileError
		print( error.message )

	var d = new dict of string,string
	d["A"] = "Rock"
	d["B"] = "Paper"
	d["C"] = "Scissors"
	
	var r1 = new dict of string,string
	r1["X"] = "Rock"
	r1["Y"] = "Paper"
	r1["Z"] = "Scissors"

	var r2 = new dict of string,string
	r2["X"] = "Lost"
	r2["Y"] = "Draw"
	r2["Z"] = "Won"

	var e = new dict of string,int
	e["Rock"] = 1
	e["Paper"] = 2
	e["Scissors"] = 3
	e["Won"] = 6
	e["Draw"] = 3
	e["Lost"] = 0


	var strats = new list of Strat

	var lines = content.split("\n")
	
	for line in lines
		if line.length == 0
			continue
		var pr = line.split(" ")
		var s = new Strat()
		s.played = pr[0]
		s.reaction = pr[1]
		strats.add(s)
		// print( s.to_string() )

	var r = new Rules()
	
	var t1 = 0
	var t2 = 0
	for strat in strats
		var p = d[strat.played]
		t1 += calc(p, r1[strat.reaction], r, e)
		t2 += calc(p, r.counter(p, r2[strat.reaction]), r, e)

		// print(@"$t1 $t2")

	print(@"$t1 $t2")
