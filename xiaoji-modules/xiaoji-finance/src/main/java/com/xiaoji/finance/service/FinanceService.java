package com.xiaoji.finance.service;

import com.xiaoji.finance.dao.BillDAO;
import com.xiaoji.finance.dao.ExpectDAO;
import com.xiaoji.finance.dao.IncomeDAO;

import com.xiaoji.finance.entity.Bill;
import com.xiaoji.finance.entity.Expect;
import com.xiaoji.finance.entity.Income;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author Sir Lancelot
 */
@Service
public class FinanceService {

    @Autowired
    private BillDAO billDAO;
    @Autowired
    private IncomeDAO incomeDAO;
    @Autowired
    private ExpectDAO expectDAO;
    /**
     * 获取家庭全部账单
     * @return 账单列表
     */
    public List<Bill> getBills(Integer familyId) {
        return billDAO.findAllByFamilyId(familyId);
    }

    /**
     * 添加一笔账单
     */
    public void addBill(Bill bill) {
        billDAO.save(bill);
    }

    /**
     * 设置家庭收入来源
     * @param income
     */
    public void setIncome(Income income) {
        incomeDAO.save(income);
    }

    public Income getIncome(Integer familyId) {
        return incomeDAO.getById(familyId);
    }

    public Expect getExpect(Integer familyId) {
        return expectDAO.getById(familyId);
    }

    /**
     * 设置消费预期（规划）
     * @param expect
     */
    public void setExpect(Expect expect) {
        expectDAO.save(expect);
    }

}
