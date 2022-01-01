package com.xiaoji.finance.controller;

import com.xiaoji.finance.entity.Bill;
import com.xiaoji.finance.entity.Expect;
import com.xiaoji.finance.entity.Income;
import com.xiaoji.finance.result.Result;
import com.xiaoji.finance.result.ResultFactory;
import com.xiaoji.finance.service.FinanceService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * @Author Sir Lancelot
 * @Description 家庭账单与财务分析、规划
 */
@RestController
@CrossOrigin
@RequestMapping("/finance")
@AllArgsConstructor
@Api( tags = "家庭理财")
public class FinanceController {

    @Autowired
    private FinanceService financeService;

    @ApiOperation(value = "家庭唯一标识符，ID", notes = "查询家庭账单")
    @GetMapping("/bills/{familyId}")
    public Result getBills(@PathVariable("familyId") Integer familyId){
        return ResultFactory.buildSuccessResult(financeService.getBills(familyId));
    }

    @ApiOperation(value = "账单", notes = "记账")
    @PostMapping("/addBill")
    public Result addBill(@RequestBody Bill bill){
        financeService.addBill(bill);
        return ResultFactory.buildSuccessResult("添加账单成功！");
    }
    @ApiOperation("展示收入组成")
    @GetMapping("/getIncome/{familyId}")
    public Result getIncome(@PathVariable(value = "familyId") Integer familyId){
        return ResultFactory.buildSuccessResult(financeService.getIncome(familyId));
    }
    @ApiOperation("设定收入")
    @PostMapping("/setIncome")
    public Result setIncome(@RequestBody Income income){
        financeService.setIncome(income);
        return ResultFactory.buildSuccessResult("收入来源设置完成！");
    }
    @ApiOperation("展示消费规划")
    @GetMapping("/getExpect/{familyId}")
    public Result getExpect(@PathVariable("familyId") Integer familyId){
        return ResultFactory.buildSuccessResult(financeService.getExpect(familyId));
    }
    @ApiOperation("设定消费预算")
    @PostMapping("/setExpect")
    public Result setExpect(@RequestBody Expect expect){
        financeService.setExpect(expect);
        return ResultFactory.buildSuccessResult("设置消费规划完成！");
    }
    @ApiOperation("计算各项消费总和")
    @GetMapping("/expense/{familyId}")
    public Result expense(@PathVariable("familyId") Integer familyId){
        return ResultFactory.buildSuccessResult(financeService.actual(familyId));
    }
}
