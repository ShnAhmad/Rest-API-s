class Test {
	String? className;
	String? path;
	int? userId;
	int? id;
	String? title;
	String? body;

	Test({
		this.className, 
		this.path, 
		this.userId, 
		this.id, 
		this.title, 
		this.body, 
	});

	factory Test.fromJson(Map<String, dynamic> json) => Test(
				className: json['__className'] as String?,
				path: json['__path'] as String?,
				userId: json['userId'] as int?,
				id: json['id'] as int?,
				title: json['title'] as String?,
				body: json['body'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'__className': className,
				'__path': path,
				'userId': userId,
				'id': id,
				'title': title,
				'body': body,
			};
}
