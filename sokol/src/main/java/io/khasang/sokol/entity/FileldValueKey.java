package io.khasang.sokol.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class FileldValueKey implements Serializable {
    @Column(name = "FIELD_ID")
    private Integer fieldId;
    @Column(name = "REQUEST_ID")
    private Integer requestId;

    public FileldValueKey(Integer fieldId, Integer requestId) {
        this.fieldId = fieldId;
        this.requestId = requestId;
    }

    public Integer getFieldId() {
        return fieldId;
    }

    public void setFieldId(Integer fieldId) {
        this.fieldId = fieldId;
    }

    public Integer getRequestId() {
        return requestId;
    }

    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }
}
