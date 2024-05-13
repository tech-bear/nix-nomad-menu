{ enable, bin }: 
{
  inherit enable;
  text = ''
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
  <key>KeepAlive</key>
  <true/>
  <key>Label</key>
  <string>com.trusourcelabs.NoMAD</string>
  <key>LimitLoadToSessionType</key>
  <array>
  <string>Aqua</string>
  </array>
  <key>ProgramArguments</key>
  <array>
  <string>${bin}</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  </dict>
  </plist>
  '';
}