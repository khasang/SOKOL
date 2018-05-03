/*
 * Copyright 2016-2018 Sokol Development Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.khasang.sokol.service;

import io.khasang.sokol.model.RequestType;
import io.khasang.sokol.repository.RequestTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class RequestTypeService {

    private RequestTypeRepository requestTypeRepository;

    @Autowired
    public RequestTypeService(RequestTypeRepository requestTypeRepository) {
        this.requestTypeRepository = requestTypeRepository;
    }

    public List<RequestType> getAll() {
        return requestTypeRepository.findAll();
    }

    public void requestTypeDelete(long id) {
        RequestType requestType = requestTypeRepository.getOne(id);
        requestType.setDeleted(true);
        requestType.setUpdatedDate(new Date());
        requestTypeRepository.save(requestType);
    }
}
