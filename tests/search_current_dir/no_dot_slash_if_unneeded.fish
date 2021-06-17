# set everything up so that a path starting with / is outputted by fzf
mock commandline \* ""
mock commandline "--current-token --replace --" "echo \$argv"
mock fd \* ""
mock fzf \* "echo /Users/patrickf"

# since there is already a /, no ./ should be prepended
set result (_fzf_search_directory)
@test "doesn't prepend ./ if path already starts with /" "$result" = /Users/patrickf
