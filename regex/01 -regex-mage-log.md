
#  how to clean a mage::log line in a file
* 1 open the file in sublime
* ctrl + h
* paste the code in the **find** part and let the **replace** part empty, this will clean the log magento to be only the value that you need
```
^(((2018\-10\-19).*\n)|[(REQUEST)|(ADDRESS)|(FILE)|(TIME)].*\n)
```
> Note: 2018-10-19 it is the day that i am getting the log, so please change to your day to make this work fine
> Note2: you always need to escape the hypen (-), so do not forget to add the back slash (\)


"IN12860 W10 NAV", "IN12860 W12 NAV", "IN12860 W14 NAV", "IN12860 W16 NAV", "IN12860 W18 NAV", "IN12860 W20 NAV", "IN12860 W22 NAV", "IN12860 W8 NAV "