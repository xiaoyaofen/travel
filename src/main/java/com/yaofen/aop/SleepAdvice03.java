package com.yaofen.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * 通过注解的方式 添加增强
 */
@Aspect
@Component
public class SleepAdvice03 {

    //切入点
    @Pointcut("execution(* *.sleep(..))")
    public void sleeppoint() {
    }

    //前置增强
    @Before("sleeppoint()")
    public void beforeSleep() {
        System.out.println("前置增强-----提交作业");
    }

    //后置增强
    @AfterReturning("sleeppoint()")
    public void afterSleep() {
        System.out.println("后置增强----睡个好觉");
    }

    // 环绕增强
    @Around("sleeppoint()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        System.out.println("环绕前置增强");
        Object object = pjp.proceed();
        System.out.println("环绕后置增强");
        return object;
    }

    // 异常增强
    @AfterThrowing(value = "execution(* *.sleep(..))")
    public void afterThrowing() throws Throwable {
        System.out.println("异常增强");
    }

    // 最终增强（无论如何都要执行的此方法）
    @After(value = "execution(* *.sleep(..))")
    public void after() throws Throwable {
        System.out.println("最终增强、、、");
    }

}