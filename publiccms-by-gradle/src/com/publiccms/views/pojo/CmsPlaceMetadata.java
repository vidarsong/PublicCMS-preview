package com.publiccms.views.pojo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sanluan.common.base.Base;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CmsPlaceMetadata extends Base {
    private String alias;
    private Integer size;
    private Integer[] adminIds;
    private boolean allowContribute;
    private List<ExtendField> extendList;

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public boolean isAllowContribute() {
        return allowContribute;
    }

    public void setAllowContribute(boolean allowContribute) {
        this.allowContribute = allowContribute;
    }

    public List<ExtendField> getExtendList() {
        return extendList;
    }

    public void setExtendList(List<ExtendField> extendList) {
        this.extendList = extendList;
    }

    public void setAdminIds(Integer[] adminIds) {
        this.adminIds = adminIds;
    }

    public Integer[] getAdminIds() {
        return adminIds;
    }
}