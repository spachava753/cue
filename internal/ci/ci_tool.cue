// Copyright 2021 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package ci

import (
	"path"
	"encoding/yaml"
	"tool/file"
)

// For the commands below, note we use simple yet hacky path resolution, rather
// than anything that might derive the module root using go list or similar, in
// order that we have zero dependencies.  This is important because this CUE
// package is "vendored" to an external dependency so that that unity can
// re-run and verify these steps as part of a the test suite that runs against
// new CUE versions.

// genworkflows regenerates the GitHub workflow Yaml definitions.
//
// See internal/ci/gen.go for details on how this step fits into the sequence
// of generating our CI workflow definitions, and updating various txtar tests
// with files from that process.
command: genworkflows: {
	_goos: string @tag(os,var=os)

	for w in workflows {
		"\(w.file)": file.Create & {
			_dir:     path.FromSlash("../../.github/workflows", path.Unix)
			filename: path.Join([_dir, w.file], _goos)
			contents: """
						 # Generated by internal/ci/ci_tool.cue; do not edit

						 \(yaml.Marshal(w.schema))
						 """
		}
	}
}
