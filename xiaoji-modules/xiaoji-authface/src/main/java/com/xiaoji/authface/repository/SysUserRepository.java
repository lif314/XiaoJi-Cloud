package com.xiaoji.authface.repository;

import com.xiaoji.authface.domain.SysUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete
@Repository
public interface SysUserRepository extends CrudRepository<SysUser, Long> {
    List<SysUser> findSysUserByUserName(String name);
    List<SysUser> findAllById(Long id);
}

/**
 * Spring automatically implements this repository interface in a bean that
 * has the same name (with a change in the case
 * it is called userRepository).
 */
