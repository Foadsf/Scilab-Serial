function [rep, stat] = seriallist()
  if getos() == "Windows" then
    [rep, stat] = dos("mode");
  elseif getos() == "Linux" then
    [rep, stat] = unix_g("dmesg | grep tty");
    // [rep, stat] = unix_g("ls /dev/ttyACM*"); // alternatively
    // setserial -bg /dev/ttyS*
    // setserial -ag /dev/ttyS0
  end
endfunction
