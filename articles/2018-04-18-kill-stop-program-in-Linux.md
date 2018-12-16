How do I kill a process / stop a program in Linux?
==================================================

Often times a process misbehaves and you may want to terminate or kill
it. In this post, lets see few ways to terminate a process or
application from Command line as well as via Graphical interface. We
will take [gedit](https://wiki.gnome.org/Apps/Gedit) as an example
application.


Kill/Stop process using Command line
------------------------------------

1. Using termination characters

   Ctrl + C
   --------

	One of the problem invoking gedit from command-line(if you have
	not started using `gedit &`) is that it will not free up the
	prompt. As a result that shell session is blocked. In such case
	Ctrl+C(press Control key in combination with 'C') comes handy.
	That will terminate `gedit` and all work is lost(unless the file
	was saved).

	What Ctrl+C does in background is, it sends
    [SIGINT](http://man7.org/linux/man-pages/man7/signal.7.html)
    signal to gedit. This is a stop signal. The default action of this
    signal is to terminate the process. It instructs shell to stop
    gedit and return to main loop and you get the prompt back.


	```
	$ gedit
	^C
	```


   Ctrl + Z
   --------

   This is called a _suspend character_. It sends
   [SIGTSTP](http://man7.org/linux/man-pages/man7/signal.7.html)
   signal to process. This is also a stop signal but the default
   action is not to kill but to suspend the process.

   It will stop(not kill/terminate) gedit and return back the shell
   prompt.

   ```
   $ gedit
   ^Z
   [1]+  Stopped                 gedit
   $
   ```

   Once the process is suspended(gedit in this case), it is not
   possible to write or do anything in gedit. In the background, the
   process becomes a _job_. This can be verified by `jobs` command.

   ```
   $ jobs
   [1]+  Stopped                 gedit
   ```

   _jobs_ allows user to control multiple processes within a single
   shell session. One can stop, resume, and move job to background or
   foreground as needed.

   Lets resume gedit in background and free up a prompt to run other
   commands. This can be done using a command `bg` followed by job
   ID(Notice `[1]` from output of `jobs` above. 1 is the job ID)

   ```
   $ bg 1
   [1]+ gedit &
   ```

   This is similar to starting `gedit` with `&` as in,

   ```
   $ gedit &
   ```


2. Using `kill`

   `kill` allows a fine controls over signals allowing a user to send
   a signal to a process by specifying either a signal name or signal
   number followed by process ID or PID.

   What I like about `kill` is, it can also work with job IDs. Lets
   start gedit in background using `gedit &`. Assuming I have a job ID
   of gedit by from `jobs` command, lets send SIGINT to gedit,

   ```
   $ kill -s SIGINT %1
   ```

   Notice that the job ID should be prefixed with '%', else `kill`
   will consider it as PID.

   `kill` can work without specifying a signal explicitly. In that
   case a default action is to send SIGTERM which will terminate the
   process. Execute `kill -l` to list all signal names and use `man
   kill` command to read the man-page.

3. Using `killall`

   If you don't like specifying job ID or PID, `killall` lets you
   specify process by name. A simplest way to terminate gedit using
   `killall` is,

   ```
   $ killall gedit
   ```

   This will kill all the processes with name "gedit". Like `kill`,
   the default signal is SIGTERM. It has fancy option to ignore case
   using '-I'. For example,

   ```
   $ gedit &
   [1] 14852

   $ killall -I GEDIT
   [1]+  Terminated              gedit
   ```

   Learn various flags provided by `killall`, the one like '-u' which
   allows to kill user owned process by exploring its man-page(`man
   killall`)


Kill/Stop graphical application
-------------------------------


1. Using `xkill`

	Ever encountered an issue where media player like
	[VLC](https://www.videolan.org/vlc/index.html) grayed out or in
	hung state? Well now you can certainly find PID and kill the
	application using above commands or use `xkill` instead.


	[IMAGE: xkill_gedit.png]
	Caption: Using xkill

	`xkill` allows you to kill a windows using a mouse. Simply execute
	`xkill` in a terminal which should change the mouse cursor to
	**x** or a tiny skull icon and click **x** on a windows you want
	to close. Be careful using `xkill` though, it can be dangerous as
	the man-page says. You have been warned!


This brings to the end of this article. We learned few techniques to
kill & stop processes. Refer man-page of each command we discussed to
understand it's usage & working. I have left commands like `pkill` and
`pgrep` for you to explore.
