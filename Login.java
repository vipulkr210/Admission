package Entry;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;



@Entity
@Table(name="Login")
public class Login {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private String email;
	private String password;
	private String department;
	private String type;
	private String username;
	private String	data;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void doGet(HttpServletRequest request ,HttpServlet response) throws Exception{
		try {
			SessionFactory factory;
			Session session2;
			Transaction transaction;
			AnnotationConfiguration cfg=new AnnotationConfiguration();
			
			factory=cfg.configure().buildSessionFactory();
			session2=factory.openSession();
			transaction=session2.beginTransaction();
			
			DateFormat fff=new SimpleDateFormat("dd/MMM/yyyy");
			data =fff.format(new Date());
			
			Login login=new Login();
			login.setDepartment(department);
			login.setEmail(email);
			login.setId(id);
			login.setName(name);
			login.setPassword(password);
			login.setType(type);
			login.setUsername(username);
			session2.save(login);
			transaction.commit();
			session2.close();
			factory.close();
			
			System.out.println("Inserted to Login ");
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
