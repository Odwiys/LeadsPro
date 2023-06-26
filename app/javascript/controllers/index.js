// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import PopupController from "./popup_controller"
application.register("popup", PopupController)

import SearchCampaignsController from "./search_campaigns_controller"
application.register("search-campaigns", SearchCampaignsController)

