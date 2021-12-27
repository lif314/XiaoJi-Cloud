package com.xiaoji.movie.dao;


import com.xiaoji.movie.entity.Film;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FilmDAO extends JpaRepository<Film, Integer> {
    List<Film> findAllByTitleContaining(String keyword);
    List<Film> findAllByType(String type);
}
