package com.utm.editors;

import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;
import java.sql.Time;

@Component
public class TimeEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String timeString) {
        timeString += ":00";
        Time time = Time.valueOf(timeString);
        this.setValue(time);
    }
}
