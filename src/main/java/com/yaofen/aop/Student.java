package com.yaofen.aop;

import org.springframework.stereotype.Component;

@Component
public class Student implements Sleepable {
    @Override
    public void sleep() {
        System.out.println("到点了，该睡觉了");
        String a = "huang";
        int b = Integer.parseInt(a);
    }
}
