package com.yaofen.mapper;

import com.yaofen.bean.Document;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DocumentMapper {
    public List<Document> findDoc(@Param("time1") String time1, @Param("time2") String time2, @Param("people") String people,
                                  @Param("title") String title, @Param("type") String type, @Param("page") Integer page1, @Param("limit") Integer limit);

    public Integer findCountDoc(@Param("time1") String time1, @Param("time2") String time2, @Param("people") String people, @Param("title") String title, @Param("type") String type);

    public List<Document> getDoc(@Param("doc") String doc);

    public Integer addDocuemnt(Document document);

    public List<Document> getDownloadDoc();

    public String findUrlById(@Param("id") String id);
}
