package com.task;

import java.util.ArrayList;
import java.util.List;

import com.entity.Solution;

public class LinearEquation 
{

    public List<Solution> calculateSolutions() {
        List<Solution> solutions = new ArrayList<>();
        int constantTerm = 30;
        int coefficientX = 5;
        int coefficientY = 3;

        for (int y = 0; y <= constantTerm / coefficientY; y++) {
            int remainder = constantTerm - coefficientY * y;
            if (remainder % coefficientX == 0) {
                int x = remainder / coefficientX;
                solutions.add(new Solution(x, y));
            }
        }

        return solutions;
    }

    public String getSolutionsAsJson() {
        List<Solution> solutions = calculateSolutions();
        StringBuilder jsonBuilder = new StringBuilder("[");
        for (int i = 0; i < solutions.size(); i++) {
            jsonBuilder.append(solutions.get(i).toString());
            if (i < solutions.size() - 1) {
                jsonBuilder.append(",");
            }
        }
        jsonBuilder.append("]");
        return jsonBuilder.toString();
    }
}