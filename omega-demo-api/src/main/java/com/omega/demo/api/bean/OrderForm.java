package com.omega.demo.api.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by jackychenb on 25/12/2016.
 */
public class OrderForm {

    public String id;
    public String userId;
    public String number;
    public BigDecimal amount;
    public Date gmtCreated;

    public List<OrderDetail> detailList;

}
