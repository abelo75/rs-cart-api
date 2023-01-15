# Task #9

## Docker and Elastic Beanstalk


## Task includes
1. Created [Dockerfile](./Dockerfile)
2. Created [.dockerignore](./.dockerignore) file and put excluded file
3. Provide explanations in `.docerignore` file
4. Optimize container/image for image size `141Mb`
5. Optimize image build time. Use multistage build
6. Use [docekrfile_lint](https://github.com/projectatomic/dockerfile_lint) for linting
5. Prepare Elastic beanstalk infrastructure
    - Create app `abelo75-cart-api`
    - Create environment `developer` with `CNAME` `abelo75-cart-api-developer`
    - Deploy cart service
    - Add environment variables for RDS database connection
    - Add SSL certificates
    - Add listener for port 443
6. Make changes in source code and deploy `eb deploy`
7. Create Nginx redirect for `HTTPS` instead `HTTP`. Browser doesn't support mixed content
8. Update FE to endpoint [https://bnstalk.ovb-tech.com/](https://bnstalk.ovb-tech.com/) instead [http://abelo75-cart-api-developer.eu-west-1.elasticbeanstalk.com/](http://abelo75-cart-api-developer.eu-west-1.elasticbeanstalk.com/)

[Cart service API Elastic beanstalk: http://abelo75-cart-api-developer.eu-west-1.elasticbeanstalk.com/](http://abelo75-cart-api-developer.eu-west-1.elasticbeanstalk.com/)

[Cart service API Elastic beanstalk: https://bnstalk.ovb-tech.com/](https://bnstalk.ovb-tech.com/)

[Frontend: https://d1w4or432cxowo.cloudfront.net/admin/orders](https://d1w4or432cxowo.cloudfront.net/admin/orders)

