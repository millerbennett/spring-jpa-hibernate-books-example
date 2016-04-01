package config;

import javax.persistence.EntityManager;
import javax.sql.DataSource;

import org.postgresql.Driver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.orm.jpa.EntityManagerFactoryInfo;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories("modules.repositories")
@EnableTransactionManagement
public class JpaConfig {
	
	@Bean
	public DataSource dataSource() {	
		SimpleDriverDataSource bean = new SimpleDriverDataSource(
				new Driver(), "jdbc:postgresql://localhost:5432/library", "librarian", "librarian");
		return bean;
	}
	
	@Bean
	public EntityManager entityManager() {
		return (EntityManager)entityManagerFactory()
				.getNativeEntityManagerFactory().createEntityManager();
	}
	
	@Bean
    public JpaTransactionManager transactionManager() {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory().getNativeEntityManagerFactory());
        return transactionManager;
    }

	@Bean
	public EntityManagerFactoryInfo entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean bean = 
				new LocalContainerEntityManagerFactoryBean();
		bean.setDataSource(dataSource());
		bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		bean.setPackagesToScan("modules.entities");
		return bean;
	}
}
