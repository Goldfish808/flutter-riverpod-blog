class JoinReqDto {
  // final 붙이는 이유는 한 번 데이터를 전달 받고 넘기는동안 바뀔 일이 없어서
  final String username;
  final String password;
  final String email;

  //생성자 생성
  JoinReqDto({required this.username, required this.password, required this.email});

  // Json으로 만들어야하니까 매핑 해준다
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password, "email": email};
  }
}

class LoginReqDto {
  final String username;
  final String password;

  //생성자 생성
  LoginReqDto({required this.username, required this.password});

  // Json으로 만들어야하니까 매핑 해준다
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
