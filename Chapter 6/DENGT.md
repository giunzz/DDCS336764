# Den GT

## 1. Đề bài 
- Thiết kế đèn giao thông có 2 ngõ ra 2 trụ đèn tín hiệu thời gian từ Xanh 15s, Vàng 5S và đỏ 20s
![alt text](img/image.png)

## 2. Phân tích
| Trạng thái | Đầu ra 1 (out1) | Đầu ra 2 (out2) | Thời gian (giây) |
| :--------: | :-------------: | :-------------: | :--------------: |
|     S1     |       100       |       001       |        15        |
|     S2     |       010       |       001       |        5         |
|     S3     |       001       |       100       |        15        |
|     S4     |       001       |       010       |        5         |

- Sơ đồ nguyên lý 
![alt text](img/sodo.png)

## 3. test bernch 

![alt text](img/result.png)