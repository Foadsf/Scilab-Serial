Serial Communication Toolbox for Scilab
=======================================

This toolbox enables the use of Serial Communication in [Scilab](http://www.scilab.org/) and [Scicoslab](http://www.scicoslab.org/). This is a fork of Aditya Sengupta's repository. Which was also a fork of the __Portable Serial Toolbox__ for Scilab originally written by [Enrico Segre](http://www.weizmann.ac.il/home/fesegre/) and has been ported to Scilab 5.x and released with his kind permission. It is licensed, at his request, under the GPLv3. 

Enrico does not wish to provide support for this toolbox anymore. An unfortunately Aditya Sengupta has also not updated his repo for the last 8 years (Twitter discussion [here](https://twitter.com/fsfarimani/status/1101466971546284032)). Therefore, for any support related queries or otherwise, please raise an issue on this repo. You can reach me at [this address](mailto:f.s.farimani@gmail.com), but I would
prefer you raise an issue on Github for problems with the toolbox. 

This toolbox is known to have worked so far on Linux based systems and on Windows (up till Windows 10 version 1809). 

The implementation via TCL wrappers is certainly suboptimal, but shouldn't be such a penalty, given the low bandwidth and the intrinsic asynchronous mode of serial communication. And mainly, it relieves the developer from supporting many platforms at once. 

A demonstration of the Toolbox coupled with SimulIDE (instructions [here](https://www.reddit.com/r/electronics/comments/awkoka/creating_a_virtual_arduino_in_simulide_and_serial/ehn6d0r)):

<center><img src="https://media.giphy.com/media/pjKdmXLikB5PpzeWBx/giphy.gif" alt="Demonstration" style="width:600px;"/></center>

Release Notes: 
==============
03/03/2019:
----------
 * now accepts com ports more than 9
 * the issue with `eval` deprecation resolved
 * `readserialline` finction added to read the serial port line by line (more info [here](https://stackoverflow.com/a/54960839/4999991))
 * unnecessary `binary scan` removed. 
 * code clean up

15/4/2012:
----------
v.0.4: Toolbox updated to be compatible with Scilab 5.4 

14/5/2011: 
----------
(First Release by Aditya Sengupta) 

v.0.3: Toolbox is now compatible with Scilab 5.x, along with help files. 

12/1/2009:
----------
(Final Release by Enrico Segre)

v.0.2: corrected version after report of [bug
3829](http://bugzilla.scilab.org/show_bug.cgi?id=3829): readserial/writeserial
confused by strings containing nonprintable ascii characters, 

Toolbox essentially still geared for scilab 4.x (4.1.2, scicoslab) in the sense that:

- ``builder.sce`` and ``loader.sce`` make use of ``xmltohtml()``, ``add_help_chapter()``; xml files are based on the 4.x dtd (IF I would be able to make doc in scilab5 I might even consider to package a new help page set together with the old)
- in many points the detour ``TCL_EvalStr("set answ [....]");
  TCL_GetVar("answ")`` is still implemented (was mandatory prior to [request
319](http://requestzilla.scilab.org/show_bug.cgi?id=319)), it is not required
since scilab 4.1.2
 
However, the toolbox is reported to work with Scilab 5.0.2 final [I suppose,
without help pages readable in the help widget, but that's minor; html files
provided, anyway]
