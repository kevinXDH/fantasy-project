package com.jay.fantasy.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.jay.fantasy.DTO.ResourceDTO;
import com.jay.fantasy.DTO.ResourceDetailDTO;
import com.jay.fantasy.VO.ResourceVO;
import com.jay.fantasy.entity.Resource;

import java.util.List;

public interface ResourceService extends IService<Resource> {

    List<ResourceDTO> getHomeResource();

    void addStarById(Integer id);

    void subStarById(Integer id);

    Page<ResourceDTO> getPage(int page, int pageSize, String text, String orderBy, String cid);

    Page<ResourceDTO> getUserResourcePage(int page, int pageSize, String text, Integer uid);

    void saveResource(ResourceVO resourceVO);

    void updateResource(ResourceVO resourceVO);

    Page<ResourceDTO> getOtherUserResourcePage(int page, int pageSize, String text, Integer uid);

    ResourceDetailDTO getResourceById(Integer id);

    List<ResourceDTO> getMoreResource();

}
