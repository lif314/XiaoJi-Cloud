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
        return incomeDAO.findByFamilyId(familyId);
    }

    public Expect getExpect(Integer familyId) {
        return expectDAO.findByFamilyId(familyId);
    }

    /**
     * 设置消费预期（规划）
     * @param expect
     */
    public void setExpect(Expect expect) {
        expectDAO.save(expect);
    }

    /**
     * 计算实际消费
     */
    public Expect actual(Integer familyId){
        Expect actual = new Expect();
        List<Bill> bills = billDAO.findAllByFamilyId(familyId);
        Double food = 0.0, clothes = 0.0, dailyNecessities = 0.0, dotc = 0.0, education = 0.0, medical = 0.0, entertainment=0.0;
        for(Bill bill: bills){
            switch (bill.getType()){
                case "food":food+=bill.getAmount();break;
                case "clothes":clothes+=bill.getAmount();break;
                case "dailyNecessities":dailyNecessities+=bill.getAmount();break;
                case "dotc":dotc+=bill.getAmount();break;
                case "education":education+=bill.getAmount();break;
                case "medical":medical+=bill.getAmount();break;
                case "entertainment":entertainment +=bill.getAmount();break;
            }
        }
        actual.setClothes(clothes);
        actual.setDailyNecessities(dailyNecessities);
        actual.setDotc(dotc);
        actual.setEducation(education);
        actual.setEntertainment(entertainment);
        actual.setFood(food);
        actual.setMedical(medical);
        return actual;
    }

}
