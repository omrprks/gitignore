# Gitignore
> Simple command-line program written in Ruby that generates .gitignore files using the http://gitignore.io/ API.

NOTE: Currently requires an active connection to the internet.

## Usage
```
 Usage: gitignore [OPTION] args
 Generate .gitignore file using gitignore.io API.

 Output will be appended if .gitignore file exists in current directory.

 options:
	-o, --out	output filename (default: \".gitignore\")
	    --overwrite	overwrite current .gitignore file (if exists)
		--show	output .gitignore file in current directory (if exists)
	-V, --version	output version information
	    --help	displays this help (\"-h\" for short message)

	args:
		.gitignore profiles (ex: Ruby, C, C++)
```

### Example
```sh
$ gitignore VisualStudioCode
```

### Output
```md
# Created by https://www.gitignore.io/api/VisualStudioCode

### VisualStudioCode ###
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# End of https://www.gitignore.io/api/VisualStudioCode
```

## License
[MIT](./LICENSE)
