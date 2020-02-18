package com.jimmy.framework.core.jdk;

import java.util.Arrays;
import java.util.List;

public class JdkStremeTest {
	
	public List<TeacherDTO> getTeachers(){
		List<TeacherDTO> list = Arrays.asList(
			      new TeacherDTO(1, "张三老师"),
			      new TeacherDTO(2, "李四老师"),
			      new TeacherDTO(3, "王五老师"),
			      new TeacherDTO(4, "赵六老师")
		);
		return list;
	}
	public List<StudentsDTO> getStudentsDTO(){
		List<StudentsDTO> list = Arrays.asList(
			      new StudentsDTO(11,"刘德华", 1),
			      new StudentsDTO(12,"张旭阳", 1),
			      new StudentsDTO(13,"张学友", 2),
			      new StudentsDTO(14,"科比", 2),
			      new StudentsDTO(15,"张思雨", 3),
			      new StudentsDTO(16,"张燕", 3),
			      new StudentsDTO(17,"易建联", 4)
			  );
		return list;
	}
	
	public static void main(String[] args) {
		JdkStremeTest service = new JdkStremeTest();
		List<StudentsDTO> students = service.getStudentsDTO();
		List<TeacherDTO> teachers = service.getTeachers();
		
		//代替join
		students.stream().forEach(
				user -> {
					TeacherDTO teacher = teachers.stream().filter(t -> t.gettId()== user.gettId()).findFirst().orElse(null);
					if(teacher != null) {
						user.settName(teacher.gettName());
					}else {
						user.settName(null);
					}
				}
		);
		students.stream().forEach(user -> System.out.println(user.toString()));
		
	}
}
