# Defined in - @ line 1
function i3r --wraps='i3-resurrect restore' --description 'alias i3r i3-resurrect restore'
  i3-resurrect restore $argv;
end
