class Response<T> {
  late Status status;
  late T data;
  late String message;

  Response.loading(this.message) : status = Status.LOADING;

  Response.completed(this.data) : status = Status.COMPLETED;

  Response.error(this.message) : status = Status.ERROR;

  Response.success(this.data) : status = Status.SUCCESS;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, SUCCESS }