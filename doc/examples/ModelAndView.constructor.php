<?php 

//Parameters combinations to call the __ModelAndView constructor:
__ModelAndView();
__ModelAndView(__View $view);
__ModelAndView('view_code');
__ModelAndView(__View $view, __ModelMap $model);
__ModelAndView('view_code',  __ModelMap $model);
__ModelAndView(__View $view, 'model_key', $model_value);
__ModelAndView('view_code',  'model_key', $model_value);
__ModelAndView('model_key',  $model_value);
 
//Examples:
//---------
//Simple constructor call (no data is set):
$MaV = new __ModelAndView();
//Set the view name in the constructor call:
$MaV = new __ModelAndView('news');
//Set the view directly in the constructor call:
$MaV = new __ModelAndView($smartyView);
//Set the view and model directly in the constructor call:
$MaV = new __ModelAndView($smartyView, $newsModel);
//Set the view and a model item in the constructor call:
$MaV = new __ModelAndView($smartyView, 'newsList', $newsList);
//Set the view name and a model item in the constructor call:
$MaV = new __ModelAndView('news', 'newsList', $newsList);
//Set a model item in the constructor call:
$MaV = new __ModelAndView('newsList', $newsList);