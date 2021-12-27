package com.xiaoji.movie.service;


import com.xiaoji.movie.dao.FilmDAO;
import com.xiaoji.movie.entity.Film;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoService {

    @Autowired
    private FilmDAO filmDAO;

    public List<Film> findAll(){
        return filmDAO.findAll();
    }

    public List<Film> Search(String keywords) {
        return filmDAO.findAllByTitleContaining(keywords);
    }

    public List<Film> findByType(String type) {
        return filmDAO.findAllByType(type);
    }
}
