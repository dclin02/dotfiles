function dp
  if count $argv > /dev/null
    if [ $argv[1] = "cs" ]
      xrandr --output eDP-1-1 --off
      xrandr --output HDMI-0 --off
      xrandr --output DP-0 --primary --mode 1920x1080 --rate 144
      return
    else if [ $argv[1] = "one" ]
      xrandr --output DP-0 --off
      xrandr --output HDMI-0 --off
      xrandr --output eDP-1-1 --mode 1920x1080 --rate 144 --primary
      return
    else if [ $argv[1] = "two" ]
      if [ $argv[2] = "ext" ]
        xrandr --output eDP-1-1 --off
        xrandr --output DP-0 --mode 1920x1080 --rate 144 --primary
        xrandr --output HDMI-0 --mode 1920x1080 --left-of DP-0
        return
      end
      xrandr --output DP-0 --mode 1920x1080 --rate 144 --primary
      xrandr --output eDP-1-1 --mode 1920x1080 --rate 144 --right-of DP-0
      xrandr --output HDMI-0 --off
      return
    end
  end
    /home/berin/display_setup.sh
end

