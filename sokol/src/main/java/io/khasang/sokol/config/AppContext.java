package io.khasang.sokol.config;

import io.khasang.sokol.beans.IMessageService;
import io.khasang.sokol.beans.impl.HelloMessage;
import io.khasang.sokol.beans.impl.User;
import io.khasang.sokol.model.CreateTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@PropertySource(value = {"classpath:util.properties"})
public class AppContext {
    @Autowired
    Environment environment;

    @Bean(name = "messageService")
    public IMessageService message(){
        return new HelloMessage();
    }

    @Bean
    public User user(){
        return new User();
    }

    @Bean
    public CreateTable createTable(){
        return new CreateTable(jdbcTemplate());
    }

    @Bean
    public DriverManagerDataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getProperty("jdbc.postgresql.driverClass"));
        dataSource.setUrl(environment.getProperty("jdbc.postgresql.url"));
        dataSource.setUsername(environment.getProperty("jdbc.postgresql.username"));
        dataSource.setPassword(environment.getProperty("jdbc.postgresql.password"));
        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate();
        jdbcTemplate.setDataSource(dataSource());
        return jdbcTemplate;
    }
}