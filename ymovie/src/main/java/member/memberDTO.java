package member;

public class memberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_nickname;
	private int mem_icon;
	private int mem_reviewCount;
	private String mem_favGenre;
	private String mem_favActor;
	private String mem_favDirector;
	public memberDTO(String mem_id, String mem_pw, String mem_nickname, int mem_icon, int mem_reviewCount, String mem_favGenre, String mem_favActor, String mem_favDirector) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nickname = mem_nickname;
		this.mem_icon = mem_icon;
		this.mem_reviewCount = mem_reviewCount;
		this.mem_favGenre = mem_favGenre;
		this.mem_favActor = mem_favActor;
		this.mem_favDirector = mem_favDirector;
	}
	public memberDTO(String mem_id, String mem_pw, String mem_nickname, int mem_icon) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nickname = mem_nickname;
		this.mem_icon = mem_icon;
		this.mem_reviewCount = 0;
		this.mem_favGenre = "";
		this.mem_favActor = "";
		this.mem_favDirector = "";
	}
	public memberDTO(String mem_id, String mem_pw, String mem_nickname) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nickname = mem_nickname;
		this.mem_icon = 1;
		this.mem_reviewCount = 0;
		this.mem_favGenre = "";
		this.mem_favActor = "";
		this.mem_favDirector = "";
	}
	public memberDTO(String mem_nickname, int mem_reviewCount, String mem_favGenre, String mem_favDirector) {
		super();
		this.mem_id = "";
		this.mem_pw = "";
		this.mem_nickname = mem_nickname;
		this.mem_icon = 1;
		this.mem_reviewCount = mem_reviewCount;
		this.mem_favGenre = mem_favGenre;
		this.mem_favActor = "";
		this.mem_favDirector = mem_favDirector;
	}
	public String getMem_id() {
		return mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public int getMem_icon() {
		return mem_icon;
	}
	public int getMem_reviewCount() {
		return mem_reviewCount;
	}
	public String getMem_favGenre() {
		return mem_favGenre;
	}
	public String getMem_favActor() {
		return mem_favActor;
	}
	public String getMem_favDirector() {
		return mem_favDirector;
	}	
}