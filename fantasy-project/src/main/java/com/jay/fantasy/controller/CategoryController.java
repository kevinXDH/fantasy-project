package com.jay.fantasy.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jay.fantasy.DTO.ResourceDTO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.Category;
import com.jay.fantasy.service.CategoryService;
import com.jay.fantasy.service.ResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("category")
@Api(tags = "分类模块接口")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("list")
    @ApiOperation(value = "查询所有分类")
    public Response<List<Category>> getList() {
        List<Category> categories = categoryService.list();
        return Response.success(categories);
    }

    @GetMapping
    @ApiOperation(value = "根据id查询分类")
    public Response<Category> getById(Integer id) {
        Category category = categoryService.getById(id);
        return Response.success(category);
    }
}
