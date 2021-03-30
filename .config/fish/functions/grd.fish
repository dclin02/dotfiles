# Defined in - @ line 1
function grd --wraps='git rebase -r develop' --description 'alias grd git rebase -r develop'
  git rebase -r develop $argv;
end
