package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.entity.Category;
import com.jay.fantasy.service.CategoryService;
import com.jay.fantasy.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
    implements CategoryService{

}




