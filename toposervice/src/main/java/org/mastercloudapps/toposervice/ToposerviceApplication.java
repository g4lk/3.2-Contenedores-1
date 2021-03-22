package org.mastercloudapps.toposervice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.retry.policy.AlwaysRetryPolicy;
import org.springframework.retry.support.RetryTemplate;

@SpringBootApplication
public class ToposerviceApplication {

	public static void main(String[] args) {
		//Retry db connection
		RetryTemplate template = new RetryTemplate();
		AlwaysRetryPolicy policy = new AlwaysRetryPolicy();
		template.setRetryPolicy(policy);
		template.execute(context -> {
			SpringApplication.run(ToposerviceApplication.class, args);
			return true;
		});
	}
}
