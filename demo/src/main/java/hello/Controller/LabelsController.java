package hello.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LabelsController{
    @RequestMapping("/labels")
    public String labels(){
        return "Labels/labels";
    }
}