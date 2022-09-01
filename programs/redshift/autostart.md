Autostart
There are several options to have Redshift automatically started:

cp /usr/share/applications/redshift.desktop ~/.config/autostart/
Exec=redshift -l 32.1:-97.2 -t 6500:3200 -g 0.8 -m randr -v

By right-clicking the system tray icon and selecting Autostart when redshift-gtk or plasma5-applets-redshift-control is already launched.
By placing a Redshift desktop entry in ~/.config/autostart/ or by adding redshift to your window manager or desktop environment's autostarting method.
By using the user units provided: redshift.service and redshift-gtk.service. Activate only one of them depending on whether or not you want the system tray icon.
Note:
The Redshift service files contain Restart=always so they will restart infinitely. See systemd.service(5).
When using a systemd user service, Xorg must be started before execution of the service, which is not the case without a display manager. Otherwise you will get RANDR Query Version' returned error -1 and Initialization of randr failed. This is already accounted for in the systemd/User method above, which contains After=display-manager.service.

