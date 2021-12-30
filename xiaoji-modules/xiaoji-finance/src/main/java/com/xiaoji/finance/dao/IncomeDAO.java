package com.xiaoji.finance.dao;

import com.xiaoji.finance.entity.Income;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface IncomeDAO extends JpaRepository<Income, Integer>, JpaSpecificationExecutor<Income> {
    Income findByFamilyId(Integer familyId);
}
