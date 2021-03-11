package com.yaofen.bean;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {
    private Integer id;
    private String title;
    private List<TreeNode> children = new ArrayList<>();
    private boolean spread;
    private boolean checked;

    public TreeNode() {
    }

    public TreeNode(Integer id, String title, List<TreeNode> children, boolean spread, boolean checked) {
        this.id = id;
        this.title = title;
        this.children = children;
        this.spread = spread;
        this.checked = checked;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }
}
