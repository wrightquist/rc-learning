{{ $lang := .Get "lang" }}
{{ $file := .Inner | plainify }}
{{ $file = replaceRE "(\\s)" "" $file }}
{{ $file = substr $file 3 -1 }}
{{ with partial "util_resolve_url" (dict "page" .Page "src" $file) }}
{{ (print "```" $lang " {src=\"" . "\"}\n" (readFile . ) "\n```") }}
{{ end }}
