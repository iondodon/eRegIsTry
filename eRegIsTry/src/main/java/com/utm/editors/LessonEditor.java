package com.utm.editors;

import com.utm.entities.Lesson;
import com.utm.services.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class LessonEditor extends PropertyEditorSupport {
    private LessonService lessonService;

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @Override
    public void setAsText(String id) {
        Lesson lesson = this.lessonService.getLessonById(Integer.parseInt(id));
        this.setValue(lesson);
    }
}
