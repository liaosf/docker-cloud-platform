# docker-cloud-platform
使用Docker构建云平台，Docker云平台系列共三讲，Docker基础、Docker进阶、基于Docker的云平台方案。    
      
基于OpenStack+Docker+RestAPI+OAuth/HMAC+RabbitMQ/ZMQ+RPC+OpenResty/HAProxy/Nginx/APIGateway+Bootstrap/AngularJS+Ansible+K8S/Mesos/Marathon构建微服务，使用实例探索微服务架构的最佳实践，希望在敏捷开发、快速部署、可维护性、可扩展性、安全、可靠、性能、日志、监控等方面形成整套行之有效的方法、理论、实践。项目持续更新。 **代码示例因涉及安全问题已删除，Sorry ~**       
    
     
     
### 概要:
* OpenStack: IAAS基础设施，云主机、网络、存储自动化。
* Docker: 使用容器作为应用交付形式，高效部署、运维。
* RestfulAPI: 后台对外接口统一使用RestfulAPI。
* OAuth/HMAC: 使用OAuth作为用户认证、鉴权，便于分布式系统扩展。
* RabbitMQ/ZMQ: 模块间交互使用消息队列，点对点+PUB/SUB模式。
* RPC: 模块之间交互也可以使用RPC，实现高性能、高并发。
* OpenResty/HAProxy/Nginx/APIGateway: 使用Nginx作为负载均衡和API网关，同时也是前端容器。
* Bootstrap/AngularJS: 使用AngularJS作为前端MVC框架。
* Ansible: 使用Ansible作为IAAS层资源自动化管理工具。
* K8S/Mesos/Marathon: 使用开源容器管理平台作为分布式系统运维自动化工具。
* Python(DjangoRestframework/Nameko/Zato), Java(SpringBoot/SpringCloud/JHispter), Golang(go-kit/gRPC)等语言微服务开发栈。    

### [推荐博文] 微服务系列文章参考：    
* 微服务架构的优势与不足：http://blog.daocloud.io/microservices-1/    
* 使用 API 网关构建微服务：http://blog.daocloud.io/microservices-2/    
* 深入微服务架构的进程间通信：http://blog.daocloud.io/microservices-3/    
* 服务发现的可行方案以及实践案例: http://blog.daocloud.io/microservices-4/    
* 微服务的事件驱动数据管理: http://blog.daocloud.io/microservices-5/    
* 选择微服务部署策略: http://blog.daocloud.io/microservices-6/    
* 将单体应用改造为微服务：http://blog.daocloud.io/microservices-7/   


