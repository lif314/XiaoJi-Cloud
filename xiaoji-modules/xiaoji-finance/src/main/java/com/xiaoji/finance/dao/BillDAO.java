package com.xiaoji.finance.dao;

import com.xiaoji.finance.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BillDAO extends JpaRepository<Bill, Integer> {
    List<Bill> findAllByFamilyId(Integer familyId);
}
