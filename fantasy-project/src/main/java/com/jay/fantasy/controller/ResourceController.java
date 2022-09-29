package com.jay.fantasy.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jay.fantasy.DTO.ResourceDTO;
import com.jay.fantasy.DTO.ResourceDetailDTO;
import com.jay.fantasy.VO.ResourceVO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.UserStar;
import com.jay.fantasy.service.ResourceService;
import com.jay.fantasy.service.UserStarService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("resource")
@Api(tags = "资源模块接口")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private UserStarService userStarService;

    @GetMapping("homeResource")
    @ApiOperation(value = "获得首页热门资源")
    public Response<List<ResourceDTO>> getHomeResource() {
        List<ResourceDTO> resourceDTOList = resourceService.getHomeResource();
        return Response.success(resourceDTOList);
    }

    @GetMapping("addStar")
    @ApiOperation(value = "增加收藏数")
    public Response<String> addStarById(Integer uid ,Integer rid) {
        resourceService.addStarById(rid);
        UserStar userStar =new UserStar();
        userStar.setUid(uid);
        userStar.setRid(rid);
        System.out.println(userStar);
        userStarService.save(userStar);
        return Response.success("增加收藏数成功");
    }

    @GetMapping("subStar/{id}")
    @ApiOperation(value = "减少收藏数")
    public Response<String> subStarById(@PathVariable("id") Integer id) {
        resourceService.subStarById(id);
        return Response.success("减少收藏数成功");
    }

    @GetMapping("page")
    @ApiOperation(value = "分页、条件查询所有用户发布的资源")
    public Response<Page<ResourceDTO>> getPage(int page, int pageSize, String text, String orderBy, String cid) {
        Page<ResourceDTO> resourceDTOList = resourceService.getPage(page, pageSize, text, orderBy, cid);
        return Response.success(resourceDTOList);
    }

    @GetMapping("getUserResourcePage")
    @ApiOperation(value = "分页、条件查询指定用户发布的资源")
    public Response<Page<ResourceDTO>> getUserResourcePage(int page, int pageSize, String text, Integer uid) {
        Page<ResourceDTO> resourceDTOList = resourceService.getUserResourcePage(page, pageSize, text, uid);
        return Response.success(resourceDTOList);
    }

    @GetMapping("getOtherUserResourcePage")
    @ApiOperation(value = "分页、条件查询除指定用户外发布的资源")
    public Response<Page<ResourceDTO>> getOtherUserResourcePage(int page, int pageSize, String text, Integer uid) {
        Page<ResourceDTO> resourceDTOList = resourceService.getOtherUserResourcePage(page, pageSize, text, uid);
        return Response.success(resourceDTOList);
    }


    @DeleteMapping
    @ApiOperation(value = "根据id删除")
    public Response<String> deleteById(int id) {
        resourceService.removeById(id);
        return Response.success("删除成功");
    }

    @PostMapping("save")
    @ApiOperation(value = "新增资源")
    public Response<String> save(@RequestBody ResourceVO resourceVO) {
        resourceService.saveResource(resourceVO);
        return Response.success("资源分享成功");
    }

    @PostMapping("update")
    @ApiOperation(value = "删除资源")
    public Response<String> update(@RequestBody ResourceVO resourceVO) {
        resourceService.updateResource(resourceVO);
        return Response.success("资源修改成功");
    }

    @GetMapping
    @ApiOperation(value = "根据id查询")
    public Response<ResourceDetailDTO> getById(Integer id) {
        ResourceDetailDTO resourceDetailDTO = resourceService.getResourceById(id);
        return Response.success(resourceDetailDTO);
    }

    @GetMapping("getMoreResource")
    @ApiOperation(value = "查询更多资源列表")
    public Response<List<ResourceDTO>> getMoreResource() {
        List<ResourceDTO> resourceDTOList = resourceService.getMoreResource();
        return Response.success(resourceDTOList);
    }
}
