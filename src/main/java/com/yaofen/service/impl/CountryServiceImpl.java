package com.yaofen.service.impl;

import com.yaofen.bean.Country;
import com.yaofen.mapper.CountryMapper;
import com.yaofen.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    CountryMapper countryMapper;

    @Override
    public List<Country> getCountryStory(String name,String img,Integer page, Integer limit) {
        return countryMapper.getCountryStory(name,img,page,limit);
    }

    @Override
    public List<Country> getCountryEat(String name,String img,Integer page, Integer limit) {
        return countryMapper.getCountryEat(name,img,page,limit);
    }

    @Override
    public List<Country> getCountryView(String name,String img,Integer page, Integer limit) {
        return countryMapper.getCountryView(name,img,page,limit);
    }

    @Override
    public List<Country> getCountryNew(String name, String img, Integer page, Integer limit) {
        return countryMapper.getCountryNew(name,img,page,limit);
    }

    @Override
    public List<Country> findCountryName() {
        return countryMapper.findCountryName();
    }

    @Override
    public String findCountryIdByName(String country) {
        return countryMapper.findCountryIdByName(country);
    }

    @Override
    public void updateCountryView(String name, String img, String time, String country,String id) {
        countryMapper.updateCountryView(name,img,time,country,id);
    }

    @Override
    public void addCountryView(String name, String img, String time, String countryid) {
        countryMapper.addCountryView(name,img,time,countryid);
    }

    @Override
    public void delCountry(String id) {
        countryMapper.delCountry(id);
    }

    @Override
    public void updateCountryStory(String name, String img, String time, String story, String id) {
        countryMapper.updateCountryStory(name,img,time,story,id);
    }

    @Override
    public void addCountryStory(String name, String img, String time, String story) {
        countryMapper.addCountryStory(name,img,time,story);
    }

    @Override
    public void delCountryStory(String id) {
        countryMapper.delCountryStory(id);
    }

    @Override
    public void updateCountryEat(String name, String img, String detail, String country, String id) {
        countryMapper.updateCountryEat(name,img,detail,country,id);
    }

    @Override
    public void addCountryEat(String name, String img, String detail, String countryid) {
        countryMapper.addCountryEat(name,img,detail,countryid);
    }

    @Override
    public void delCountryEat(String id) {
        countryMapper.delCountryEat(id);
    }

    @Override
    public void updateCountryNew(String name, String img, String time, String country, String id) {
        countryMapper.updateCountryNew(name,img,time,country,id);
    }

    @Override
    public void addCountryNew(String name, String img, String time, String countryid) {
        countryMapper.addCountryNew(name,img,time,countryid);
    }

    @Override
    public void delCountryNew(String id) {
        countryMapper.delCountryNew(id);
    }

    @Override
    public List<Country> getResource(String id, String type) {
        return countryMapper.getResource(id,type);
    }

    @Override
    public List<Country> getResourceList( String type) {
        return countryMapper.getResourceList(type);
    }

    @Override
    public void updateCountryClick(String id, String type) {
        countryMapper.updateCountryClick(id,type);
    }

    @Override
    public void updateCountryGood(String id, String type) {
        countryMapper.updateCountryClick(id,type);
    }
}
