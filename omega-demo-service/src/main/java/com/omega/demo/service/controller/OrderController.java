package com.omega.demo.service.controller;

import com.omega.demo.api.GUID;
import com.omega.demo.api.bean.OrderForm;
import com.omega.demo.api.bean.User;
import com.omega.demo.api.error.CommonError;
import com.omega.demo.api.exception.BizException;
import com.omega.demo.service.domain.OrderEntity;
import com.omega.demo.service.domain.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

/**
 * Created by wuzhengtao on 16/12/6.
 */

@RestController
public class OrderController {

    @Autowired
    OrderEntity orderEntity;

    @Autowired
    UserEntity userEntity;

    @RequestMapping("/order/{id}")
    public OrderForm getById(@PathVariable("id") String id) {
        return orderEntity.getOrderById(id);
    }

    @RequestMapping("/orders/{userId}")
    public List<OrderForm> list(@PathVariable("userId") String userId) {
        return orderEntity.getOrderFormListByUserId(userId);
    }

    @RequestMapping(value="/testOrder")
    public void testCreate(@PathVariable("userId") String userId) {
        User user = userEntity.getById(userId);
        if (user == null) {
            throw new BizException(CommonError.RECORD_NOT_EXIST);
        }

        OrderForm o = new OrderForm();
        o.id = generateId(user.zoneCode);
        o.userId = userId;
        o.number = "xxx";
        o.amount = new BigDecimal(new Random().nextInt(500));
        orderEntity.createOrder(o);
    }

    private String generateId(String zoneCode) {
        return GUID.get() + zoneCode;
    }

}
