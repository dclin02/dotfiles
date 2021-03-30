# Defined in - @ line 1
function gp --wraps='ps aux | grep' --description 'alias gp ps aux | grep'
  ps aux | grep $argv;
end
