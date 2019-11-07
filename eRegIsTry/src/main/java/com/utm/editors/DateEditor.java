package com.utm.editors;

import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String timestamp) {
        System.out.println(timestamp);
        timestamp = timestamp.replace('T', ' ');
        Date truc = null;
        try {
            truc = new SimpleDateFormat( "yyyy-MM-dd HH:mm").parse(timestamp);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        this.setValue(truc);
    }
}
