struct None {}

type Myfn = fn (int) int

type Myfnfact = fn () Myfn

type Maybefnfact = Myfnfact | None

// Myfn
fn abc(i int) int {
	return i
}

// create Myfn
fn myfnfact() Myfn {
	return abc
}

// run fn if exists
fn run(mmff Maybefnfact) string {
	match mmff {
		Myfnfact {
			r := mmff()
			return 'yes fn: ${r}'
		}
		None {
			return 'None fn'
		}
	}
}

fn test_sumtype_with_alias_fntype_fn_call() {
	r1 := main.myfnfact()(1)
	println(r1)
	assert r1 == 1

	r2 := run(None{})
	println(r2)
	assert r2 == 'None fn'

	r3 := run(myfnfact)
	println(r3)
	assert r3 == 'yes fn: fn (int) int'
}
