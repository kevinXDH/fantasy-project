package com.jay.fantasy.mapper;

import com.jay.fantasy.entity.Resource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

public interface ResourceMapper extends BaseMapper<Resource> {

    void addStarById(Integer id);

    void subStarById(Integer id);

    List<Integer> getIds();

}




