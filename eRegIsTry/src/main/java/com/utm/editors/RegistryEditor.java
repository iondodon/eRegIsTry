package com.utm.editors;

import com.utm.entities.Registry;
import com.utm.services.RegistryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class RegistryEditor extends PropertyEditorSupport {
    private RegistryService registryService;

    @Autowired
    public void setRegistryService(RegistryService registryService) {
        this.registryService = registryService;
    }

    @Override
    public void setAsText(String id) {
        Registry registry = this.registryService.getRegistryById(Integer.parseInt(id));
        this.setValue(registry);
    }
}
