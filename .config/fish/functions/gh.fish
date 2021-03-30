# Defined in - @ line 1
function gh --wraps='history | grep' --description 'alias gh history | grep'
  history | grep $argv;
end
