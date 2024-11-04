Tạo thư mục làm việc và chuyển vào đó
- mkdir /tools && cd /tools

Sao chép mã nguồn từ kho GitHub
- git clone https://github.com/ThuanPhucIT/ELKStack.git

Di chuyển vào thư mục ELKStack
- cd ELKStack

Chạy script để cài đặt Docker và Docker Compose (nếu chưa cài đặt)
- bash docker-install.sh

Mở file cấu hình .env để tùy chỉnh
- nano .env 

- Trong file .env:
   - Cập nhật IP "192.168.224.130" thành IP của máy hiện tại
   - Thay đổi mật khẩu cho ELASTIC_PASSWORD và KIBANA_PASSWORD (nếu muốn)

Tạo network Docker để kết nối các container
- docker network create PrviNetwork

Thiết lập tài khoản cho Elasticsearch và tạo chứng chỉ cho Kibana
- docker-compose -f docker-compose.setup-es.yml up -d

Tạo key-store cho Kibana và thêm chứng chỉ Kibana vừa tạo
- docker-compose -f docker-compose.setup-kibana.yml up -d

Cài đặt và khởi động Elasticsearch, Kibana, và Logstash
- docker-compose up -d

Chờ vài phút để Elasticsearch khởi động xong

Mở trình duyệt và kiểm tra truy cập Elasticsearch tại địa chỉ:
# http://<IP-của-bạn>:9200/ 
- Tên đăng nhập: elastic
- Mật khẩu: 035714

Mở Kibana trên trình duyệt tại địa chỉ:
# http://<IP-của-bạn>:5601/
 - Tên đăng nhập: elastic
 - Mật khẩu: 035714

Cài đặt ELK Stack xong rồi nhé !!!
