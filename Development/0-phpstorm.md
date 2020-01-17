## How to configure memory for the PHP storm?

## Menu way
1 - Expand the Help menu
2 - Click to "Change Memory Settings"

## File way
* filepath: ~/.PhpStorm2019.3/config/phpstorm64.vmoptions 
```bash
    $ vim ~/.PhpStorm2019.3/config/phpstorm64.vmoptions magento@127.0.0.1
```
### Sample
```
-Xms1096m
-Xmx3096m
-XX:ReservedCodeCacheSize=240m
-XX:+UseConcMarkSweepGC
-XX:SoftRefLRUPolicyMSPerMB=50
-ea
-XX:CICompilerCount=2
-Dsun.io.useCanonPrefixCache=false
-Djava.net.preferIPv4Stack=true
-Djdk.http.auth.tunneling.disabledSchemes=""
-XX:+HeapDumpOnOutOfMemoryError
-XX:-OmitStackTraceInFastThrow
-Djdk.attach.allowAttachSelf
-Dawt.useSystemAAFontSettings=lcd
-Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderingEngine
-Dsun.tools.attach.tmp.only=true
```