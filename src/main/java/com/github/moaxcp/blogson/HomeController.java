package com.github.moaxcp.blogson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class HomeController {
    @RequestMapping("/")
    public ModelAndView index() throws InterruptedException {
        long startTime = System.nanoTime();
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("controllerTime", System.nanoTime() - startTime);
        return mv;
    }

    @RequestMapping("/pages")
    public ModelAndView pages() {
        return new ModelAndView("pages/index");
    }
}
