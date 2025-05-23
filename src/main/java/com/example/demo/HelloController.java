package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HelloController {

    @GetMapping("/")
    public String showForm() {
        return "form";
    }

    @GetMapping("/hello")
    public String greet(@RequestParam(name = "name", defaultValue = "Гость") String name, Model model) {
        model.addAttribute("name", name);
        return "hello";
    }
}
