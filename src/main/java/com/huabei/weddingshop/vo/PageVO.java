package com.huabei.weddingshop.vo;

import java.util.List;

/**
 * 分页辅助类
 */
public class PageVO<T> {

    private Integer pageNow;
    private Integer myPages;
    private String query;
    private List<T> list;

    public PageVO() {
    }

    public PageVO(Integer pageNow, Integer myPages, String query, List<T> list) {
        this.pageNow = pageNow;
        this.myPages = myPages;
        this.query = query;
        this.list = list;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getMyPages() {
        return myPages;
    }

    public void setMyPages(Integer myPages) {
        this.myPages = myPages;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageVO{" +
                "pageNow=" + pageNow +
                ", myPages=" + myPages +
                ", query='" + query + '\'' +
                ", list=" + list +
                '}';
    }
}
