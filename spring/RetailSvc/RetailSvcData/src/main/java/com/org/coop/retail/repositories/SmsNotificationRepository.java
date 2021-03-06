package com.org.coop.retail.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import com.org.coop.retail.entities.SmsNotification;

public interface SmsNotificationRepository extends JpaRepository<SmsNotification, Integer>, QueryDslPredicateExecutor<SmsNotification> {
	
	
}
