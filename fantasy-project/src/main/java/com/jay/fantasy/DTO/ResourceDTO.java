package com.jay.fantasy.DTO;

import com.jay.fantasy.entity.Resource;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ResourceDTO extends Resource implements Serializable {
    private List<String> tagArr;
}
