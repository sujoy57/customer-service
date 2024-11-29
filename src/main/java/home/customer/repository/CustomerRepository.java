package home.customer.repository;


import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import home.customer.model.Customer;

import java.util.List;

/* Dao Class */

@Repository
public class CustomerRepository {
    private final JdbcTemplate jdbcTemplate;

    public CustomerRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Customer> findAll() {
        String sql = "SELECT id, name, email, phone_number FROM customers";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Customer.class));
    }

    public Customer findById(Long id) {
        String sql = "SELECT id, name, email, phone_number FROM customers WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Customer.class), id);
    }

    public int save(Customer customer) {
        String sql = "INSERT INTO customers (name, email, phone_number) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhoneNumber());
    }

    public int update(Customer customer) {
        String sql = "UPDATE customers SET name = ?, email = ?, phone_number = ? WHERE id = ?";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhoneNumber(), customer.getId());
    }

    public int deleteById(Long id) {
        String sql = "DELETE FROM customers WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}