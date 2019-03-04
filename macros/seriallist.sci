function [rep, stat] = seriallist()
  if getos() == "Windows" then
    [rep, stat] = dos("mode");
  elseif getos() == "Linux" then
    [rep, stat] = unix_g("dmesg | grep tty");
    // [rep, stat] = unix_g("ls /dev/ttyACM*"); // alternatively 
  end
endfunction
