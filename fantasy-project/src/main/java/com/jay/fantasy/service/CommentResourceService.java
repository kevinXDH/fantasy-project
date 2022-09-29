package com.jay.fantasy.service;

import com.jay.fantasy.DTO.CommentResourceDTO;
import com.jay.fantasy.entity.CommentResource;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface CommentResourceService extends IService<CommentResource> {

    List<CommentResourceDTO> getListByRid(Integer rid);

    List<CommentResourceDTO> getAllComment();

}
