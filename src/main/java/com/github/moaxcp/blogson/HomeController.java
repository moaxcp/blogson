package com.github.moaxcp.blogson;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.SQLException;

@Controller
public class HomeController {

    @RequestMapping("/")
    public ModelAndView index() throws InterruptedException {
        long startTime = System.nanoTime();
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("controllerTime", System.nanoTime() - startTime);
        return mv;
    }

    @RequestMapping("/{siteName}")
    public ModelAndView indexForSiteName(String siteName) {
        //todo this is a cross cutting concern. consider using aop for controllerTime here and in index()
        long startTime = System.nanoTime();
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("siteName", siteName);
        mv.addObject("controllerTime", System.nanoTime() - startTime);
        return mv;
    }

    @RequestMapping("/pages")
    public ModelAndView pages() {
        return new ModelAndView("pages/index");
    }

    @RequestMapping(path="/emailpic/{user}", produces=MediaType.IMAGE_PNG_VALUE)
    @ResponseBody
    public byte[] emailPicture(@PathVariable("user") String user) throws SQLException, ClassNotFoundException, IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ImageIO.write(utilities.getEmailPic(user), "png", out);
        return out.toByteArray();
    }
}
