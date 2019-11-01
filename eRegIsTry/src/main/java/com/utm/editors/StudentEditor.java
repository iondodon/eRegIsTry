package com.utm.editors;

import com.utm.entities.Student;
import com.utm.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class StudentEditor extends PropertyEditorSupport {
    private StudentService studentService;

    @Autowired
    void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @Override
    public void setAsText(String id) {
        Student student = this.studentService.getStudentById(Integer.parseInt(id));
        this.setValue(student);
    }
}
