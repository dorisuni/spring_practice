package com.icia.member.service;

import com.icia.member.repository.MarketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public class MarketService {
    @Autowired
    private MarketRepository marketRepository;
}
