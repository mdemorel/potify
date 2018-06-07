import "bootstrap";
import "mdi/css/materialdesignicons.min.css";
import "../plugins/flatpickr";
import "../components/select_size";
import { sizeChoice } from "../components/size_choice";
import {plantChoice} from "../components/plant_choice";
import {tabs} from "../components/tabs";
import {triggerClick} from "../components/dashboard_card_item";
import { fireUploadButton } from "../components/upload_button";


sizeChoice();

import { updateTaskStatus, updateTaskStatusOnShow } from "../components/tasks_manager";
updateTaskStatus();
updateTaskStatusOnShow();

import { bindSweetAlertButtonDemo } from '../components/sweet_alert';
bindSweetAlertButtonDemo();

global.bindSweetAlertButtonDemo = bindSweetAlertButtonDemo;

plantChoice();
tabs();
triggerClick();
fireUploadButton();
