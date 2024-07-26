package net.javaguides.sms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import net.javaguides.sms.entity.Student;
import net.javaguides.sms.service.StudentService;

@Controller
public class StudentController {

	@Autowired
    private StudentService studentService;

  

    @GetMapping("/students")
    public String listStudents(Model model) {
        try {
            List<Student> allStudents = studentService.getAllStudents();
            System.out.println("students  : " + allStudents.toString());
            model.addAttribute("students", allStudents);
            return "students";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error retrieving students: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("/students/new")
    public String createStudentForm(Model model) {
        try {
            Student student = new Student();
            model.addAttribute("student", student);
            return "create_student";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error displaying create student form: " + e.getMessage());
            return "error";
        }
    }

    @PostMapping("/students")
    public String saveStudent(@ModelAttribute("student") Student student, Model model) {
        try {
            studentService.saveStudent(student);
            return "redirect:/students";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error saving student: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("/students/edit/{id}")
    public String editStudentForm(@PathVariable Long id, Model model) {
        try {
            model.addAttribute("student", studentService.getStudentById(id));
            return "edit_student";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error displaying edit student form: " + e.getMessage());
            return "error";
        }
    }

    @PostMapping("/students/{id}")
    public String updateStudent(@PathVariable Long id, @ModelAttribute("student") Student student, Model model) {
        try {
            Student existingStudent = studentService.getStudentById(id);
            existingStudent.setId(id);
            existingStudent.setFirstName(student.getFirstName());
            existingStudent.setLastName(student.getLastName());
            existingStudent.setEmail(student.getEmail());

            studentService.updateStudent(existingStudent);
            return "redirect:/students";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error updating student: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("/students/{id}")
    public String deleteStudent(@PathVariable Long id, Model model) {
        try {
            studentService.deleteStudentById(id);
            return "redirect:/students";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error deleting student: " + e.getMessage());
            return "error";
        }
    }
}
