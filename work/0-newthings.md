
# How to encrypt the password
* YOu must use this url to access the encryption: https://bcrypt-generator.com/
* 
# URL structure
* http://demo.blocworx.local/job/[JOBID]/scan-station/[Scan Station ID]



how the url loads the html template for a form using app.js
review the associated html templates for that form

indexhtml
app.js
Controller: application/js/controllers/job-setup/scanStationCtrl.js
Another Controller which is used: application/js/controllers/EnterDataCtrl.js

scan-station.html
scan-station-fields.html
scan-station-form-buttons.html
scan-station-results.html
scan-station-results-calendar.html
scan-station-results-default.html
scan-station-results-vertical-rows.html


Use Service: application/js/services/job-setup/scanStationService.js routes/web.php

to figure out what models and controllers are being used
