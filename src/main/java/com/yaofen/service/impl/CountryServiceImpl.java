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
    public List<Country> getCountryStory(Integer page, Integer limit) {
        return countryMapper.getCountryStory(page,limit);
    }

    @Override
    public List<Country> getCountryEat(Integer page, Integer limit) {
        return countryMapper.getCountryEat(page,limit);
    }

    @Override
    public List<Country> getCountryView(Integer page, Integer limit) {
        return countryMapper.getCountryView(page,limit);
    }
}
