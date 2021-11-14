package movie;

public class movieDTO {
	private String mov_name;
	private String mov_code;
	private int mov_year;
	private int mov_state;
	private String mov_genre;
	public movieDTO(String mov_name, String mov_code, int mov_year, int mov_state, String mov_genre) {
		super();
		this.mov_name = mov_name;
		this.mov_code = mov_code;
		this.mov_year = mov_year;
		this.mov_state = mov_state;
		this.mov_genre = mov_genre;
	}
	public movieDTO(String mov_name, String mov_code, String mov_genre) {
		super();
		this.mov_name = mov_name;
		this.mov_code = mov_code;
		this.mov_genre = mov_genre;
	}
	public String getMov_name() {
		return mov_name;
	}
	public String getMov_code() {
		return mov_code;
	}
	public int getMov_year() {
		return mov_year;
	}
	public int getMov_state() {
		return mov_state;
	}
	public String getMov_genre() {
		return mov_genre;
	}	
}