// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChoosePreviousQuestionsController from "./choose_previous_questions_controller"
application.register("choose-previous-questions", ChoosePreviousQuestionsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import SearchCampaignsController from "./search_campaigns_controller"
application.register("search-campaigns", SearchCampaignsController)

import PopupController from "./popup_controller"
application.register("popup", PopupController)

import OptionsController from "./options_controller";
application.register("options", OptionsController);
