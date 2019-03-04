function h=openserial(p, smode, translation, handshake, xchar, timeout)

  if ~exists("p","local") then 
    disp("you should specify the serial port. These are the available serial ports at the moment")
    disp(seriallist)
  end
  
  if type(p) == 8 & 0 < p then
    if getos() == "Windows" then
      port = "\\\\.\\com" + string(p);
    elseif getos() == "Linux" then
      port = "/dev/ttyS" + string(p-1);
    else
      disp("The operating system is not currently supported")
    end
  elseif type(p) == 10 then
     port = p;
  else
     error("port to open must be either a positive integer or a string")
  end

  TCL_EvalStr("set porthandle [open " + port + " r+]"); 
  h = TCL_GetVar("porthandle");
    
  // parsing communication modes: via fconfigure: -translation
  // -mode,-handshake, -xchar, -timeout, -blocking
  //   translation=["auto","binary","cr","crlf","lf"]
//   handshake=["none","rtscts","xonxoff","dtrdsr"]
//   xchar=[,] 

  if ~exists("smode", "local") then
    smode = "9600,n,8,1";
  end
  TCL_EvalStr("fconfigure " + h + " -mode " + smode)
  
//defalut translation is binary to avoid input character count skew  
  if ~exists("translation", "local") then
     translation = "binary";
  end
  TCL_EvalStr("fconfigure "+h+" -translation "+translation)  
  
 //does nonblocking work the way I'd expect?
  if ~exists("blocking", "local") then
     blocking=%f
  end
  TCL_EvalStr("fconfigure " + h + " -blocking " + string(bool2s(blocking))) 

  if exists("handshake", "local") then
    TCL_EvalStr("fconfigure " + h + " -handshake " + handshake)
  end   
  
  if exists("xchar", "local") then
    TCL_EvalStr("fconfigure " + h + " -xchar {" + string(xchar) + "}")
  end
  
  if exists("timeout", "local") then
    TCL_EvalStr("fconfigure " + h + " -timeout {" + string(timeout) + "}")
  end   
  
endfunction
