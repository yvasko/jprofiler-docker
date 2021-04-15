package com.example.demo.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestingController {
    @GetMapping("/test")
    public String test() throws InterruptedException {
        for (int i = 0; i < 20; i++) {
            doSomething();
        }
        return "Test";
    }

    private void doSomething() throws InterruptedException {
        Thread.sleep(1000);
    }
}
