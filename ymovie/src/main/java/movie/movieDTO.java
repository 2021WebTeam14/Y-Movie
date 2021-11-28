package movie;

public class movieDTO {
	private String mov_name;
	private String mov_code;
	private int mov_year;
	private String mov_state;
	private String mov_genre;
	private int starSum;
	
	public movieDTO(String mov_name, String mov_code, int mov_year, String mov_state, String mov_genre, int starSum) {
		super();
		this.mov_name = mov_name;
		this.mov_code = mov_code;
		this.mov_year = mov_year;
		this.mov_state = mov_state;
		this.mov_genre = mov_genre;
		this.starSum = starSum;
	}
	public movieDTO(String mov_name, String mov_code, int mov_year, String mov_state, String mov_genre) {
		super();
		this.mov_name = mov_name;
		this.mov_code = mov_code;
		this.mov_year = mov_year;
		this.mov_state = mov_state;
		this.mov_genre = mov_genre;
		this.starSum = 0;
	}
	public movieDTO(String mov_name, String mov_code, String mov_genre) {
		super();
		this.mov_name = mov_name;
		this.mov_code = mov_code;
		this.mov_year = 0;
		this.mov_state = null;
		this.mov_genre = mov_genre;
		this.starSum = 0;
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
	public String getMov_state() {
		return mov_state;
	}
	public String getMov_genre() {
		return mov_genre;
	}
	public int getStarSum() {
		return starSum;
	}
}