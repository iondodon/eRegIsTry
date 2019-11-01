package com.utm.editors;

import com.utm.entities.Administrator;
import com.utm.services.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class AdministratorEditor extends PropertyEditorSupport {
    private AdministratorService administratorService;

    @Autowired
    void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @Override
    public void setAsText(String text) {
        Administrator administrator = this.administratorService.getAdministratorById(Integer.parseInt(text));
        this.setValue(administrator);
    }
}
