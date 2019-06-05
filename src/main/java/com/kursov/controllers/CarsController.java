package com.kursov.controllers;

import com.kursov.dao.CarsDao;
import com.kursov.model.Cars;
import com.kursov.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CarsController {

    @Autowired
    CarsService carsService;

    @RequestMapping(value = "/cars",method = RequestMethod.GET)
    ModelAndView cars (){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/showCars");
        List<Cars> cars = carsService.findAll();
        modelAndView.addObject("cars", cars);
        return modelAndView;

    }

}
