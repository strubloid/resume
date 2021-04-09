import * as angular from 'angular';

"use strict";

angular.module('TemplateModule')
       .controller('templateController', TemplateController);

// Injection of each class
TemplateController.$inject = ['$scope'];

// Controller Constructor
function TemplateController($scope) {

    // Creating the view model reference
    let vm = this;

    vm.$onInit = async function () {
        try {


        } catch (e) {
            console.log(e);
        }

    }

}

export default TemplateController;
