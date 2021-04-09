import * as angular from 'angular';

"use strict";

angular.module('TemplateModule')
       .factory('TemplateFactory', TemplateFactory);

TemplateFactory.$inject = ['$http', 'Configuration'];

/**
 * Object that will create a Page Factory, all methods of factory
 * will be available from outside.
 *
 * @param $http
 * @param Configuration
 * @constructor
 */
function TemplateFactory($http, Configuration) {

    let factory = this;


    factory.getTemplates = (moduleId) => {
        // TODO build how to get all templates
    }

    return factory;

}

export default TemplateFactory;
