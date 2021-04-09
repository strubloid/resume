import * as angular from 'angular';
import TemplateController from "./controllers/template.controller";

"use strict";

let scanStationEditPageComponent =  {
    templateUrl: 'components/template/template/scan-station/edit-page.html',
    controller: TemplateController,
    controllerAs: 't',
    bindings: {
        scanStation: '<',
    }
}

angular.module('TemplateModule')
       .component('scanStationEditPage', scanStationEditPageComponent);
