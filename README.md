# 소켓정리

- 메인소켓

  - server

    ```
    Socket Language Golang

    ```

  - client
    ```
    Socket Client Java
    ```

- QA소켓

  - server
    ```
    Socket Language Nodejs
    ```
  - client
    ```
    Socket Client Python
    ```

- 웹소켓
  - server
    ```
    Socket Language Nodejs
    ```
  - client
    ```
    Socket Language Html5
    ```

### DB

- Redis
  ```
  메인소켓 워치 온/오프 관리
  ```
- Mongodb
  ```
  QA소켓 정보 관리
  ```

```mermaid
sequenceDiagram
  participant 메인소켓
  메인소켓-->>웹소켓: 워치번호전달
  participant 웹소켓
  메인소켓-->>QA소켓: 걸음수 복약여부 신규회원정보
  QA소켓-->>메인소켓: 복약오류수정결과
  participant QA소켓

```
