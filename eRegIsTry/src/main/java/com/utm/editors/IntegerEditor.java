package com.utm.editors;

import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class IntegerEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        Integer integer = Integer.parseInt(text);
        this.setValue(integer);
    }
}
