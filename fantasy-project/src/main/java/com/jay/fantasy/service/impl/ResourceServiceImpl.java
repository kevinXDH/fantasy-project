package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.DTO.ResourceDTO;
import com.jay.fantasy.DTO.ResourceDetailDTO;
import com.jay.fantasy.VO.ResourceVO;
import com.jay.fantasy.entity.Resource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.mapper.UserMapper;
import com.jay.fantasy.service.ResourceService;
import com.jay.fantasy.mapper.ResourceMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<ResourceDTO> getHomeResource() {
        LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Resource::getStar);
        queryWrapper.last("limit 8");
        List<Resource> resources = this.list(queryWrapper);
        List<ResourceDTO> resourceDTOS = resources.stream().map(e -> {
            ResourceDTO dto = new ResourceDTO();
            BeanUtils.copyProperties(e, dto, "tag");
            dto.setTagArr(getTagArr(e.getTag()));
            return dto;
        }).collect(Collectors.toList());
        return resourceDTOS;
    }

    @Override
    public void addStarById(Integer id) {
        resourceMapper.addStarById(id);
    }

    @Override
    public void subStarById(Integer id) {
        resourceMapper.subStarById(id);
    }

    @Override
    public Page<ResourceDTO> getPage(int page, int pageSize, String text, String orderBy, String cid) {
        Page<Resource> pageInfo = new Page<>(page, pageSize);
        Page<ResourceDTO> dtoPageInfo = new Page<>();
        LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.
                like(StringUtils.hasText(text), Resource::getContent, text).or().
                like(StringUtils.hasText(text), Resource::getName, text).or().
                like(StringUtils.hasText(text), Resource::getTag, text).or().
                like(StringUtils.hasText(text), Resource::getDescription, text).or().
                orderByDesc("star".equals(orderBy), Resource::getStar).or().
                orderByDesc("time".equals(orderBy), Resource::getCreateTime).or().
                eq(!"".equals(cid) && cid != null, Resource::getCid, cid);
        return getResourceDTOPage(pageInfo, dtoPageInfo, queryWrapper);
    }

    @Override
    public Page<ResourceDTO> getUserResourcePage(int page, int pageSize, String text, Integer uid) {
        Page<Resource> pageInfo = new Page<>(page, pageSize);
        Page<ResourceDTO> dtoPageInfo = new Page<>();
        LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.
                like(StringUtils.hasText(text), Resource::getContent, text).or().
                like(StringUtils.hasText(text), Resource::getName, text).or().
                like(StringUtils.hasText(text), Resource::getTag, text).or().
                like(StringUtils.hasText(text), Resource::getDescription, text).
                orderByDesc(Resource::getCreateTime)
                .eq(uid != null, Resource::getUid, uid);
        return getResourceDTOPage(pageInfo, dtoPageInfo, queryWrapper);
    }

    private Page<ResourceDTO> getResourceDTOPage(Page<Resource> pageInfo, Page<ResourceDTO> dtoPageInfo, LambdaQueryWrapper<Resource> queryWrapper) {
        this.page(pageInfo, queryWrapper);
        List<Resource> resources = pageInfo.getRecords();
        List<ResourceDTO> resourceDTOList = resources.stream().map(item -> {
            ResourceDTO dto = new ResourceDTO();
            BeanUtils.copyProperties(item, dto, "tag");
            dto.setTagArr(getTagArr(item.getTag()));
            return dto;
        }).collect(Collectors.toList());
        dtoPageInfo.setRecords(resourceDTOList);
        dtoPageInfo.setTotal(pageInfo.getTotal());
        return dtoPageInfo;
    }

    @Override
    public void saveResource(ResourceVO resourceVO) {
        Resource resource = new Resource();
        resource.setTag(resourceVO.getTagArr().toString());
        BeanUtils.copyProperties(resourceVO, resource);
        this.save(resource);
    }

    @Override
    public void updateResource(ResourceVO resourceVO) {
        Resource resource = new Resource();
        resource.setTag(resourceVO.getTagArr().toString());
        BeanUtils.copyProperties(resourceVO, resource);
        this.updateById(resource);
    }

    @Override
    public Page<ResourceDTO> getOtherUserResourcePage(int page, int pageSize, String text, Integer uid) {
        Page<Resource> pageInfo = new Page<>(page, pageSize);
        Page<ResourceDTO> dtoPageInfo = new Page<>();
        LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.
                like(StringUtils.hasText(text), Resource::getContent, text).or().
                like(StringUtils.hasText(text), Resource::getName, text).or().
                like(StringUtils.hasText(text), Resource::getTag, text).or().
                like(StringUtils.hasText(text), Resource::getDescription, text).
                orderByDesc(Resource::getCreateTime)
                .ne(uid != null, Resource::getUid, uid);
        return getResourceDTOPage(pageInfo, dtoPageInfo, queryWrapper);
    }

    @Override
    public ResourceDetailDTO getResourceById(Integer id) {
        Resource resource = this.getById(id);
        ResourceDetailDTO dto =new ResourceDetailDTO();
        BeanUtils.copyProperties(resource,dto);
        List<String> tagArr = getTagArr(resource.getTag());
        User user = userMapper.selectById(resource.getUid());
        dto.setUser(user);
        dto.setTagArr(tagArr);
        return dto;
    }

    @Override
    public List<ResourceDTO> getMoreResource() {
        List<Integer> ids = resourceMapper.getIds();
        List<Integer> randomIds = new ArrayList<>();
        Random r= new Random();
        int start =4;
        for (int i = 0; i < start; i++) {
            if (!randomIds.contains(ids.get(r.nextInt(ids.size())))){
                randomIds.add(ids.get(r.nextInt(ids.size())));
            }else {
                start++;
            }
        }
        LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(Resource::getId,randomIds);
        List<Resource> resources = this.list(queryWrapper);
        List<ResourceDTO> resourceDTOS = resources.stream().map(e -> {
            ResourceDTO dto = new ResourceDTO();
            BeanUtils.copyProperties(e, dto, "tag");
            dto.setTagArr(getTagArr(e.getTag()));
            return dto;
        }).collect(Collectors.toList());
        return resourceDTOS;
    }

    private List<String> getTagArr(String tag) {
        String newTag = tag.substring(1, tag.length() - 1);
        String[] tagArr = newTag.split(",");
        return Arrays.asList(tagArr);
    }
}




