// Code generated by cuelang.org/go/pkg/gen. DO NOT EDIT.
package yaml

funcs: Marshal: {
	in: [{
		name: "v"
		type: _
	}]
	out: string
}
funcs: MarshalStream: {
	in: [{
		name: "v"
		type: _
	}]
	out: string
}
funcs: Unmarshal: {
	in: [{
		name: "data"
		type: bytes | string
	}]
	out: _
}
funcs: UnmarshalStream: {
	in: [{
		name: "data"
		type: bytes | string
	}]
	out: _
}
funcs: Validate: {
	in: [{
		name: "b"
		type: bytes | string
	}, {
		name: "v"
		type: _
	}]
	out: bool
}
funcs: ValidatePartial: {
	in: [{
		name: "b"
		type: bytes | string
	}, {
		name: "v"
		type: _
	}]
	out: bool
}