# tạo thư mục làm việc 
- mkidr /tools && cd /tools

# tải code về 
- git clone https://github.com/ThuanPhucIT/ELKStack.git

# di chuyển vào thư mục ELKStack
- cd ELKStack

# nếu chưa tải docker và docker-compose thì thực hiện
- bash docker-install.sh

# thay đổi các cấu hình
- nano .env 

# đổi ip 192.1268.224.130 thành ip trên máy 
# đổi ELASTIC_PASSWORD, KIBANA_PASSWORD (option)

# tạo network cho các containers
- docker network create PrviNetwork

# tạo các key(tài khoản cho user elastic) và tạo cert cho kibana
- docker-compose -f docker-compose.setup-es.yml up -d

# tạo key-store cho kibana (thêm cert kibana vừa tạo ở bước trên)
- docker-compose -f docker-compose.setup-kibana.yml up -d

# đã thiết lập xong các key và cert => cài đặt elasticsearch, kibana, logstash
- docker-compose up -d

# chờ 1 lúc để elasticsearch khởi động

# vào trình duyệt http://192.168.224.130:9200/ 
# nhập user : elastic
# nhập pass : 035714

# vào trình duyệt http://192.168.224.130:5601/ 
# nhập user : elastic
# nhập pass : 035714

# => Cài đặt xong ELK