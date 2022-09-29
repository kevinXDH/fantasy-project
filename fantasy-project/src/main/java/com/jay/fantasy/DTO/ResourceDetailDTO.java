package com.jay.fantasy.DTO;

import com.jay.fantasy.entity.Resource;
import com.jay.fantasy.entity.User;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ResourceDetailDTO extends Resource implements Serializable {
    private List<String> tagArr;

    private User user;
}
