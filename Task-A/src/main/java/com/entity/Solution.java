package com.entity;

public class Solution {
    public int x;
    public int y;

    public Solution(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public String toString() {
        return "{\"x\":" + x + ", \"y\":" + y + "}";
    }
}
