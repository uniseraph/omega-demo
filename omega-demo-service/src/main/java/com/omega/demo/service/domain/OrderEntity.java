package com.omega.demo.service.domain;

import com.omega.demo.service.dao.OrderDao;
import com.omega.demo.api.bean.OrderDetail;
import com.omega.demo.api.bean.OrderForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by jackychenb on 25/12/2016.
 */

@Service
public class OrderEntity {

    @Autowired
    private OrderDao dao;

    @Transactional
    public void createOrder(OrderForm o) {
        dao.createOrderForm(o);

        for (OrderDetail d : o.getDetailList()) {
            dao.createOrderDetail(d);
        }
    }

    public OrderForm getOrderById(String id) {
        OrderForm o = dao.getOrderFormById(id);
        if (o == null) {
            return null;
        }

        o.setDetailList(dao.getOrderDetailListByOrderFormId(id));
        return o;
    }

    public List<OrderForm> getOrderFormListByUserId(String userId) {
        return dao.getOrderFormListByUserId(userId);
    }

}
