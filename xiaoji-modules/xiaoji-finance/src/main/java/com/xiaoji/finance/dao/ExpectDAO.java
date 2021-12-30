package com.xiaoji.finance.dao;

import com.xiaoji.finance.entity.Expect;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpectDAO extends JpaRepository<Expect, Integer> {
    Expect findByFamilyId(Integer familyId);
}
