package com.icia.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;


public class MarketDTO extends imageDTO {
    private Long id;
    private String goodsName;
    private int goodsPrice;
    private String goodsDescription;
    private float saleRatio;
    private int goodsSalePrice;
    private Date purchaseDate;
    private String deliveryType;
    private String goodsContents;
    private String seller;
    private String packingType;
    private String goodsWeight;
    private String goodsOrigin;
    private String expirationDate;
    private int stock;


}
